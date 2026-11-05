# -*- coding: utf-8 -*-
import subprocess
import urllib.request
import json
import os
import sys

# 1. Get GitHub token from Git Credential Manager
p = subprocess.Popen(['git', 'credential', 'fill'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
stdout, _ = p.communicate(input='protocol=https\nhost=github.com\n\n')
token = ''
for line in stdout.splitlines():
    if line.startswith('password='):
        token = line.split('=', 1)[1]

if not token:
    print("Error: Could not retrieve GitHub token from Git Credential Manager")
    sys.exit(1)

headers_api = {
    'Authorization': f'token {token}',
    'Accept': 'application/vnd.github.v3+json',
    'User-Agent': 'EduPath-Release-Uploader'
}

repo = 'hungbbdzz/UX_UI'
# Get release info
req = urllib.request.Request(f'https://api.github.com/repos/{repo}/releases', headers=headers_api)
with urllib.request.urlopen(req) as resp:
    releases = json.loads(resp.read().decode('utf-8'))

if not releases:
    print("No releases found on GitHub repository")
    sys.exit(1)

target_release = releases[0]
rel_id = target_release['id']
print(f"Target Release: {target_release.get('name')} (ID: {rel_id}, Tag: {target_release.get('tag_name')})")

# Delete existing EduPath_v2.apk asset if present
for asset in target_release.get('assets', []):
    if asset['name'] == 'EduPath_v2.apk':
        aid = asset['id']
        print(f"Deleting old asset {aid} ({asset['name']}, {asset['size']} bytes)...")
        del_req = urllib.request.Request(f'https://api.github.com/repos/{repo}/releases/assets/{aid}', headers=headers_api, method='DELETE')
        try:
            with urllib.request.urlopen(del_req) as del_resp:
                print(f"Deleted old asset successfully: status {del_resp.status}")
        except Exception as e:
            print(f"Warning while deleting old asset: {e}")

# 2. Upload new APK
apk_path = r'c:\Documents\Materials\UX UI\final\figmatoCode\EduPath_v2.apk'
apk_size = os.path.getsize(apk_path)
print(f"Uploading new APK from {apk_path} ({apk_size} bytes / {apk_size / 1024 / 1024:.1f} MB)...")

upload_url = f'https://uploads.github.com/repos/{repo}/releases/{rel_id}/assets?name=EduPath_v2.apk'
headers_upload = {
    'Authorization': f'token {token}',
    'Content-Type': 'application/vnd.android.package-archive',
    'Content-Length': str(apk_size),
    'User-Agent': 'EduPath-Release-Uploader'
}

with open(apk_path, 'rb') as f:
    apk_data = f.read()

up_req = urllib.request.Request(upload_url, data=apk_data, headers=headers_upload, method='POST')
with urllib.request.urlopen(up_req) as up_resp:
    res = json.loads(up_resp.read().decode('utf-8'))
    print(f"\n[SUCCESS] Upload complete!")
    print(f"  Asset ID: {res.get('id')}")
    print(f"  Asset Name: {res.get('name')}")
    print(f"  File Size: {res.get('size')} bytes ({res.get('size') / 1024 / 1024:.1f} MB)")
    print(f"  Download URL: {res.get('browser_download_url')}")
    print(f"  Updated at: {res.get('updated_at')}")

