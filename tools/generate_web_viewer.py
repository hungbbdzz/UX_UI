# -*- coding: utf-8 -*-
"""
Sinh trang Web Interactive Prototype Viewer (output/index.html) V2.1
Khắc phục:
1. Chiều rộng khung viewport cố định chuẩn 390px (triệt tiêu 100% độ lệch phải/dưới do co giãn).
2. Tích hợp hàm tính scale động getScale() cho cả Hotspots và Auto-Demo.
3. Di chuyển Camera / Speaker lên viền Bezel phần cứng phía trên màn hình (không chạm vào Header/Title).
4. Tọa độ nút bấm được hiệu chỉnh theo các layer Figma thực tế.
"""

import os
import json
import re

root_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
output_dir = os.path.join(root_dir, "output")
proto_file = os.path.join(output_dir, "prototype_graph.json")
flutter_screens_dir = os.path.join(root_dir, "frontend", "flutter", "lib", "screens")

def clean_var_name(name):
    s = re.sub(r'[^A-Za-z0-9_]', '_', name)
    s = re.sub(r'_+', '_', s).strip('_')
    if not s or s[0].isdigit():
        s = "Screen_" + s
    return s

with open(proto_file, "r", encoding="utf-8") as f:
    proto_data = json.load(f)

screens = proto_data.get("screens", [])
flows = proto_data.get("flows", [])

count_a = sum(1 for s in screens if "Part A" in s.get("page", ""))
count_b = sum(1 for s in screens if "Part B" in s.get("page", ""))
count_c = sum(1 for s in screens if "Part C" in s.get("page", ""))
count_d = sum(1 for s in screens if "Part D" in s.get("page", ""))

screens_data = []
for sc in screens:
    pascal = sc["pascal_name"]
    safe_name = sc.get("safe_name") or clean_var_name(sc["name"])
    rn_file = os.path.join(output_dir, "react_native", "screens", f"{pascal}Screen.tsx")
    
    flutter_code = ""
    m = re.match(r'^([ASas]\d+)', sc["name"])
    code_prefix = m.group(1).lower() if m else None
    
    if os.path.exists(flutter_screens_dir):
        if code_prefix:
            for fn in os.listdir(flutter_screens_dir):
                if fn.lower().startswith(code_prefix + "_") and fn.endswith(".dart"):
                    with open(os.path.join(flutter_screens_dir, fn), "r", encoding="utf-8") as f:
                        flutter_code = f.read()
                    break
        if not flutter_code:
            safe_fn = os.path.join(flutter_screens_dir, f"{safe_name.lower()}.dart")
            if os.path.exists(safe_fn):
                with open(safe_fn, "r", encoding="utf-8") as f:
                    flutter_code = f.read()

    if not flutter_code:
        out_flutter_file = os.path.join(output_dir, "flutter", "lib", "screens", f"{safe_name.lower()}.dart")
        if os.path.exists(out_flutter_file):
            with open(out_flutter_file, "r", encoding="utf-8") as f:
                flutter_code = f.read()
            
    rn_code = ""
    if os.path.exists(rn_file):
        with open(rn_file, "r", encoding="utf-8") as f:
            rn_code = f.read()

    screens_data.append({
        "id": sc["id"],
        "name": sc["name"],
        "page": sc["page"],
        "pascal_name": pascal,
        "safe_name": safe_name,
        "width": sc["width"],
        "height": sc["height"],
        "interactions": sc.get("outgoing_links", []),
        "hotspots": sc.get("hotspots", []),
        "flutter_code": flutter_code,
        "rn_code": rn_code
    })

screens_json = json.dumps(screens_data, ensure_ascii=False)
flows_json = json.dumps(flows, ensure_ascii=False)

html_content = f"""<!DOCTYPE html>
<html lang="vi" class="h-full">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>EduPath · Trình mô phỏng Prototype Figma Chuẩn xác (V2.1)</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet" />
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {{
      theme: {{
        extend: {{
          colors: {{
            primary: '#2A14B4',
            secondary: '#FD761A',
            darkbg: '#0B0F19',
            panelbg: '#161F30',
            surface: '#F9F9FF'
          }},
          fontFamily: {{
            sans: ['Inter', 'sans-serif'],
            mono: ['JetBrains Mono', 'monospace']
          }}
        }}
      }}
    }}
  </script>
  <style>
    /* Phone Screen Frame 390x750 */
    #phone-screen-frame {{
      width: 390px !important;
      min-width: 390px !important;
      max-width: 390px !important;
      height: 760px !important;
    }}
    /* Viewport điện thoại chuẩn 390px tuyệt đối */
    #phone-screen-viewport {{
      width: 390px !important;
      min-width: 390px !important;
      max-width: 390px !important;
      scrollbar-width: none !important;
      -ms-overflow-style: none !important;
    }}
    #phone-screen-viewport::-webkit-scrollbar {{
      display: none !important;
    }}
    #pinned-bottom-nav {{
      width: 390px !important;
      min-width: 390px !important;
      max-width: 390px !important;
      height: 64px !important;
    }}
    #screen-render-target,
    #screen-render-target img {{
      width: 390px !important;
      min-width: 390px !important;
      max-width: 390px !important;
      display: block !important;
    }}
    /* Ripple click animation */
    .tap-ripple {{
      position: absolute;
      width: 44px;
      height: 44px;
      border-radius: 9999px;
      background: rgba(253, 118, 26, 0.55);
      border: 2px solid #FD761A;
      transform: translate(-50%, -50%) scale(0.2);
      pointer-events: none;
      z-index: 9999;
      animation: tapPulse 0.55s ease-out forwards;
    }}
    @keyframes tapPulse {{
      0% {{ transform: translate(-50%, -50%) scale(0.2); opacity: 1; }}
      100% {{ transform: translate(-50%, -50%) scale(2.4); opacity: 0; }}
    }}
    /* Click target pointer for Auto Demo */
    .auto-demo-pointer {{
      position: absolute;
      width: 32px;
      height: 32px;
      transform: translate(-50%, -50%);
      pointer-events: none;
      z-index: 9998;
      transition: all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
    }}
    /* Click target highlight border */
    .auto-demo-box {{
      position: absolute;
      border: 2.5px solid #FD761A;
      background: rgba(253, 118, 26, 0.22);
      border-radius: 12px;
      box-shadow: 0 0 16px rgba(253, 118, 26, 0.65);
      pointer-events: none;
      z-index: 9997;
      animation: boxPulse 1.2s infinite alternate;
      box-sizing: border-box;
    }}
    @keyframes boxPulse {{
      0% {{ opacity: 0.75; transform: scale(0.99); }}
      100% {{ opacity: 1; transform: scale(1.01); }}
    }}
    /* Hotspot hover style */
    .hotspot-overlay {{
      position: absolute;
      cursor: pointer;
      border-radius: 8px;
      transition: background 0.15s ease, outline 0.15s ease;
      z-index: 30;
      box-sizing: border-box;
    }}
    .hotspot-overlay:hover {{
      background: rgba(42, 20, 180, 0.16);
      outline: 2px dashed #2A14B4;
    }}
  </style>
</head>
<body class="h-full bg-darkbg text-slate-100 flex flex-col font-sans select-none overflow-hidden">

  <!-- TOP HEADER -->
  <header class="h-14 bg-panelbg border-b border-slate-700/60 flex items-center justify-between px-4 z-40 shrink-0">
    <div class="flex items-center gap-3">
      <div class="w-8 h-8 rounded-lg bg-primary flex items-center justify-center font-bold text-white shadow-md">EP</div>
      <div>
        <h1 class="font-bold text-sm text-white flex items-center gap-2">
          EduPath Prototype Engine (V2.1)
          <span class="text-[10px] bg-emerald-500/20 text-emerald-400 font-semibold px-2 py-0.5 rounded-full border border-emerald-500/30">
            Figma Live Synced · {len(screens)} Màn hình
          </span>
        </h1>
        <p class="text-[11px] text-slate-400">Khung viền 390px chuẩn xác tuyệt đối · Camera đặt ngoài màn hình</p>
      </div>
    </div>

    <!-- Controls -->
    <div class="flex items-center gap-2">
      <button id="auto-demo-btn" onclick="toggleAutoDemo()" class="h-8 px-3 rounded-lg bg-secondary hover:bg-secondary/90 text-white text-xs font-semibold flex items-center gap-1.5 shadow-md transition">
        <span class="material-symbols-outlined text-sm">play_circle</span>
        <span id="auto-demo-text">Chạy Demo Luồng Này</span>
      </button>

      <button id="record-btn" onclick="toggleScreenRecord()" class="h-8 px-3 rounded-lg bg-red-500/15 hover:bg-red-500/25 border border-red-500/40 text-red-400 text-xs font-semibold flex items-center gap-1.5 transition">
        <span class="material-symbols-outlined text-sm">videocam</span>
        <span>Quay video Demo</span>
      </button>

      <button onclick="openCodeModal()" class="h-8 px-3 rounded-lg bg-primary hover:bg-primary/90 text-white text-xs font-semibold flex items-center gap-1.5 shadow-sm transition">
        <span class="material-symbols-outlined text-sm">code</span>
        <span>Mã nguồn (Flutter/RN)</span>
      </button>
    </div>
  </header>

  <!-- MAIN WORKSPACE -->
  <div class="flex-1 flex overflow-hidden">
    
    <!-- LEFT SIDEBAR: Screen list -->
    <aside class="w-84 bg-panelbg/70 border-r border-slate-700/60 flex flex-col shrink-0">
      <!-- Search & Filter -->
      <div class="p-3 border-b border-slate-700/60">
        <div class="relative">
          <span class="material-symbols-outlined absolute left-2.5 top-2.5 text-slate-400 text-sm">search</span>
          <input
            id="search-input"
            type="text"
            placeholder="Tìm kiếm màn hình..."
            oninput="filterScreens()"
            class="w-full bg-slate-800 border border-slate-700 rounded-lg pl-8 pr-3 py-1.5 text-xs text-white placeholder-slate-400 focus:outline-none focus:border-primary"
          />
        </div>
        <div class="grid grid-cols-5 gap-1 mt-2">
          <button onclick="setTab('all')" id="tab-all" class="py-1 text-[10px] font-semibold rounded bg-primary text-white truncate" title="Tất cả ({len(screens)})">Tất cả ({len(screens)})</button>
          <button onclick="setTab('part_a')" id="tab-part_a" class="py-1 text-[10px] font-semibold rounded bg-slate-800 text-slate-300 hover:bg-slate-700 truncate" title="Part A ({count_a})">Part A ({count_a})</button>
          <button onclick="setTab('part_b')" id="tab-part_b" class="py-1 text-[10px] font-semibold rounded bg-slate-800 text-slate-300 hover:bg-slate-700 truncate" title="Part B ({count_b})">Part B ({count_b})</button>
          <button onclick="setTab('part_c')" id="tab-part_c" class="py-1 text-[10px] font-semibold rounded bg-slate-800 text-slate-300 hover:bg-slate-700 truncate" title="Part C ({count_c})">Part C ({count_c})</button>
          <button onclick="setTab('part_d')" id="tab-part_d" class="py-1 text-[10px] font-semibold rounded bg-slate-800 text-slate-300 hover:bg-slate-700 truncate" title="Part D ({count_d})">Part D ({count_d})</button>
        </div>
      </div>

      <!-- Screen List Container -->
      <div id="screens-container" class="flex-1 overflow-y-auto p-2 space-y-1">
        <!-- Rendered by JS -->
      </div>
    </aside>

    <!-- CENTER: Phone Canvas -->
    <main class="flex-1 flex flex-col items-center justify-center p-3 overflow-y-auto relative bg-[#070A11]">
      
      <!-- Top Screen Navigation & Flow Progress -->
      <div class="mb-2 flex items-center gap-3 bg-panelbg/90 backdrop-blur px-4 py-2 rounded-xl border border-slate-700/70 text-xs z-30">
        <button onclick="goPrevScreen()" class="p-1 rounded hover:bg-slate-700 text-slate-300 transition" title="Màn trước">
          <span class="material-symbols-outlined text-sm">arrow_back</span>
        </button>
        <div class="flex items-center gap-2">
          <span id="current-screen-badge" class="font-bold text-white text-xs">S01 – Splash</span>
          <span id="current-flow-step-tag" class="text-[10px] bg-secondary/20 text-secondary font-semibold px-2 py-0.5 rounded border border-secondary/30 hidden">
            Bước 1/10
          </span>
        </div>
        <button onclick="goNextScreen()" class="p-1 rounded hover:bg-slate-700 text-slate-300 transition" title="Màn tiếp">
          <span class="material-symbols-outlined text-sm">arrow_forward</span>
        </button>
      </div>

      <!-- IPHONE 13 PRO HARDWARE CHASSIS (Ultra-Slim Metallic Bezel & Authentic Design) -->
      <div id="phone-hardware-chassis" class="relative w-[406px] bg-gradient-to-b from-[#2b303d] via-[#1c202a] to-[#0f131c] rounded-[50px] p-[8px] border-[2px] border-[#3f4657]/70 shadow-[0_25px_65px_-12px_rgba(0,0,0,0.85),0_0_0_1px_rgba(255,255,255,0.12),inset_0_1px_2px_rgba(255,255,255,0.25)] flex flex-col items-center shrink-0 transition-all select-none">
        
        <!-- PHYSICAL HARDWARE BUTTONS (Left & Right Edges) -->
        <!-- Mute Switch (Left) -->
        <div class="absolute -left-[5px] top-[95px] w-[3px] h-[22px] bg-[#363d4d] rounded-l-sm shadow-sm pointer-events-none"></div>
        <!-- Volume Up (Left) -->
        <div class="absolute -left-[5px] top-[138px] w-[3px] h-[46px] bg-[#363d4d] rounded-l-sm shadow-sm pointer-events-none"></div>
        <!-- Volume Down (Left) -->
        <div class="absolute -left-[5px] top-[196px] w-[3px] h-[46px] bg-[#363d4d] rounded-l-sm shadow-sm pointer-events-none"></div>
        <!-- Power Button (Right) -->
        <div class="absolute -right-[5px] top-[152px] w-[3px] h-[68px] bg-[#363d4d] rounded-r-sm shadow-sm pointer-events-none"></div>

        <!-- ANTENNA BANDS (Subtle Metallic Seams) -->
        <div class="absolute -left-[2px] top-[68px] w-[2px] h-[3px] bg-[#12151d] pointer-events-none"></div>
        <div class="absolute -right-[2px] top-[68px] w-[2px] h-[3px] bg-[#12151d] pointer-events-none"></div>
        <div class="absolute -left-[2px] bottom-[68px] w-[2px] h-[3px] bg-[#12151d] pointer-events-none"></div>
        <div class="absolute -right-[2px] bottom-[68px] w-[2px] h-[3px] bg-[#12151d] pointer-events-none"></div>

        <!-- Phone Screen Inside Viewport Frame (EXACTLY 390px WIDE x 760px HIGH) -->
        <div id="phone-screen-frame" class="relative w-[390px] h-[760px] bg-white rounded-[42px] overflow-hidden flex flex-col select-none ring-1 ring-black/40 shadow-inner">
          
          <!-- IPHONE 13 PRO / 14 STATUS BAR (Cố định ở đỉnh, bảo vệ Safe Area - Không bị đè khi cuộn) -->
          <header id="phone-status-bar" class="w-[390px] h-[40px] shrink-0 bg-[#F9F9FF] border-b border-slate-200/50 flex items-center justify-between px-6 relative z-50 select-none shadow-[0_1px_3px_rgba(0,0,0,0.03)] transition-colors duration-200">
            <!-- Left: Time 9:41 -->
            <span id="status-time" class="text-[12px] font-semibold text-slate-800 tracking-tight font-sans pl-1">9:41</span>

            <!-- Center Notch Space -->
            <div class="w-[124px] h-[23px] bg-[#000000] rounded-b-[15px] absolute top-0 left-1/2 -translate-x-1/2 flex items-center justify-center gap-2.5 px-3 pointer-events-none shadow-sm">
              <div class="w-[38px] h-[3.5px] bg-[#1a1d24] rounded-full ring-1 ring-white/10"></div>
              <div class="w-[7px] h-[7px] bg-[#0d1017] rounded-full ring-1 ring-[#1f2638] flex items-center justify-center">
                <div class="w-[3px] h-[3px] bg-[#0b1b3a] rounded-full"></div>
              </div>
            </div>

            <!-- Right: Status Icons (Cellular, Wifi, Battery) -->
            <div id="status-icons" class="flex items-center gap-1.5 text-slate-800 pr-1">
              <span class="material-symbols-outlined text-[13px] leading-none">signal_cellular_alt</span>
              <span class="material-symbols-outlined text-[13px] leading-none">wifi</span>
              <span class="material-symbols-outlined text-[15px] leading-none">battery_full</span>
            </div>
          </header>

          <!-- Scrollable Screen Content (Takes remaining height above pinned nav) -->
          <div id="phone-screen-viewport" class="relative w-[390px] flex-1 min-h-0 overflow-y-auto overflow-x-hidden flex flex-col select-none">
            <!-- Rendered content (Image + Hotspots Layer) -->
            <div id="screen-render-target" class="w-[390px] relative">
              <!-- Rendered by JS -->
            </div>
          </div>

          <!-- PINNED / FIXED 5-TAB BOTTOM NAVIGATION BAR (Exact Figma Spec) -->
          <nav id="pinned-bottom-nav" class="w-[390px] h-[68px] pb-3 bg-white/95 backdrop-blur-md border-t border-slate-200/90 px-1 flex items-center justify-around shrink-0 z-40 transition-all select-none shadow-[0_-4px_16px_rgba(0,0,0,0.04)] relative">
            <!-- Rendered dynamically by renderPinnedBottomNav(sc) -->
            <!-- INTEGRATED HOME BAR (Pinned inside bottom dock) -->
            <div class="absolute bottom-1.5 left-1/2 -translate-x-1/2 w-32 h-1 bg-slate-800/40 rounded-full pointer-events-none"></div>
          </nav>
        </div>
      </div>

      <!-- Hint bar below phone -->
      <div class="mt-2 text-[11px] text-slate-500 flex items-center gap-1.5">
        <span class="material-symbols-outlined text-xs text-secondary">touch_app</span>
        <span>Bạn có thể bấm trực tiếp vào các nút bấm trên màn hình điện thoại hoặc chọn link bên phải.</span>
      </div>

    </main>

    <!-- RIGHT SIDEBAR: Flow Selector & Prototype Interactions Panel -->
    <aside class="w-88 bg-panelbg/70 border-l border-slate-700/60 flex flex-col shrink-0">
      
      <!-- FLOW SELECTION TABS -->
      <div class="p-3 border-b border-slate-700/60 bg-slate-900/50">
        <div class="text-[11px] font-bold text-slate-300 uppercase tracking-wider mb-2 flex items-center gap-1.5">
          <span class="material-symbols-outlined text-secondary text-sm">account_tree</span>
          Kịch bản luồng chạy (5 Flows)
        </div>
        <select id="flow-select" onchange="onFlowSelected(this.value)" class="w-full bg-slate-800 border border-slate-700 rounded-lg px-2.5 py-1.5 text-xs text-white focus:outline-none focus:border-secondary">
          <!-- Populated by JS -->
        </select>
        <div id="flow-desc" class="text-[11px] text-slate-400 mt-1.5 leading-snug">
          Onboarding, khảo sát mục tiêu, trình độ, xếp lớp và gợi ý lộ trình
        </div>
      </div>

      <!-- Flow Timeline Steps / Action Buttons -->
      <div class="p-2 border-b border-slate-700/60 flex items-center justify-between bg-slate-800/30 text-xs">
        <span class="font-semibold text-slate-300" id="flow-steps-title">Các bước trong luồng:</span>
        <div class="flex gap-1">
          <button onclick="stepFlow(-1)" class="px-2 py-0.5 rounded bg-slate-800 hover:bg-slate-700 text-slate-300 text-[11px] font-medium border border-slate-700">Trước</button>
          <button onclick="stepFlow(1)" class="px-2 py-0.5 rounded bg-secondary hover:bg-secondary/90 text-white text-[11px] font-medium shadow-sm">Tiếp theo →</button>
        </div>
      </div>

      <!-- Flow Steps List / Interactions List -->
      <div id="flow-steps-container" class="max-h-48 overflow-y-auto p-2 border-b border-slate-700/60 space-y-1 bg-slate-900/30">
        <!-- Rendered by JS -->
      </div>

      <!-- Outgoing Prototype Links Header -->
      <div class="px-3 py-2 border-b border-slate-700/60 flex items-center justify-between">
        <h2 class="text-xs font-bold text-white uppercase tracking-wider flex items-center gap-1.5">
          <span class="material-symbols-outlined text-primary text-sm">link</span>
          Liên kết từ màn này
        </h2>
        <span id="interactions-count-badge" class="text-[10px] bg-slate-800 text-slate-400 px-2 py-0.5 rounded-full font-mono">0</span>
      </div>

      <div id="interactions-list" class="flex-1 overflow-y-auto p-2.5 space-y-1.5">
        <!-- Rendered by JS -->
      </div>

      <!-- Current Screen Meta Details -->
      <div class="p-2.5 border-t border-slate-700/60 bg-slate-800/40 text-[11px] text-slate-400 space-y-1">
        <div class="flex justify-between">
          <span>Kích thước gốc:</span>
          <span id="meta-size" class="font-mono text-slate-200">390 x 844</span>
        </div>
        <div class="flex justify-between">
          <span>Figma Node ID:</span>
          <span id="meta-node-id" class="font-mono text-slate-200">11:5</span>
        </div>
        <div class="flex justify-between">
          <span>Phân nhóm:</span>
          <span id="meta-page" class="text-slate-200 truncate max-w-[140px]">Part A</span>
        </div>
      </div>
    </aside>

  </div>

  <!-- TOAST NOTIFICATION FOR CROSS-PART / BRIDGE LINKS -->
  <div id="toast-notification" class="fixed bottom-6 left-1/2 -translate-x-1/2 bg-slate-900/95 border border-primary/60 text-white px-4 py-2.5 rounded-xl shadow-2xl z-50 text-xs flex items-center gap-2 transition-all duration-300 opacity-0 pointer-events-none transform translate-y-3">
    <span class="material-symbols-outlined text-secondary text-base">info</span>
    <span id="toast-text">Thông báo</span>
  </div>

  <!-- CODE MODAL (Flutter & React Native) -->
  <div id="code-modal" class="fixed inset-0 bg-black/80 backdrop-blur-sm z-50 hidden flex items-center justify-center p-6">
    <div class="bg-panelbg border border-slate-700 rounded-2xl w-full max-w-4xl h-[85vh] flex flex-col shadow-2xl overflow-hidden">
      <div class="h-12 border-b border-slate-700 px-4 flex items-center justify-between">
        <div class="flex items-center gap-3">
          <span class="font-bold text-sm text-white" id="modal-screen-title">Mã nguồn màn hình</span>
          <div class="flex bg-slate-800 rounded p-0.5 text-xs">
            <button onclick="switchCodeTab('flutter')" id="code-tab-flutter" class="px-3 py-1 font-semibold rounded bg-primary text-white">Flutter</button>
            <button onclick="switchCodeTab('rn')" id="code-tab-rn" class="px-3 py-1 font-semibold rounded text-slate-400 hover:text-white">React Native</button>
          </div>
        </div>
        <div class="flex items-center gap-2">
          <button onclick="copyCurrentCode()" class="px-3 py-1 bg-slate-800 hover:bg-slate-700 border border-slate-700 text-xs font-semibold rounded text-slate-200 flex items-center gap-1 transition">
            <span class="material-symbols-outlined text-xs">content_copy</span>
            <span id="copy-btn-text">Sao chép</span>
          </button>
          <button onclick="closeCodeModal()" class="p-1 rounded hover:bg-slate-800 text-slate-400 hover:text-white">
            <span class="material-symbols-outlined text-sm">close</span>
          </button>
        </div>
      </div>
      <div class="flex-1 p-4 overflow-hidden bg-[#0D1117]">
        <pre class="w-full h-full overflow-auto font-mono text-xs text-emerald-400 p-2"><code id="code-snippet"></code></pre>
      </div>
    </div>
  </div>

  <!-- INLINE DATA & RUNTIME LOGIC -->
  <script>
    const SCREENS = {screens_json};
    const FLOWS = {flows_json};

    let currentIndex = 0;
    let activeTab = 'all';
    let activeCodeTab = 'flutter';
    let isAutoDemo = false;
    let autoDemoTimer = null;
    let currentFlowIndex = 0;
    let currentFlowStepIndex = 0;
    let mediaRecorder = null;
    let recordedChunks = [];

    // Lấy tỷ lệ scale động giữa chiều rộng thực tế của ảnh và 390px chuẩn
    function getScreenScale() {{
      const img = document.querySelector('#screen-render-target img');
      if (!img || !img.clientWidth) return 1.0;
      return img.clientWidth / 390.0;
    }}

    // Khởi tạo giao diện
    window.addEventListener('DOMContentLoaded', () => {{
      initFlowSelect();
      renderSidebar();
      loadScreen(0);
    }});

    function initFlowSelect() {{
      const select = document.getElementById('flow-select');
      select.innerHTML = '';
      FLOWS.forEach((fl, idx) => {{
        const opt = document.createElement('option');
        opt.value = idx;
        opt.textContent = `${{fl.name}} (${{fl.tag}})`;
        select.appendChild(opt);
      }});
      updateFlowUI();
    }}

    function onFlowSelected(val) {{
      currentFlowIndex = parseInt(val, 10);
      currentFlowStepIndex = 0;
      updateFlowUI();
      const fl = FLOWS[currentFlowIndex];
      if (fl && fl.steps.length > 0) {{
        goToScreenByPascal(fl.steps[0].pascal);
      }}
    }}

    function updateFlowUI() {{
      const fl = FLOWS[currentFlowIndex];
      if (!fl) return;
      document.getElementById('flow-desc').textContent = fl.desc;
      
      const container = document.getElementById('flow-steps-container');
      container.innerHTML = '';

      fl.steps.forEach((st, idx) => {{
        const item = document.createElement('div');
        const isCurrent = idx === currentFlowStepIndex;
        item.className = `p-1.5 rounded text-[11px] flex items-center justify-between cursor-pointer transition ${{
          isCurrent 
            ? 'bg-secondary text-white font-semibold shadow-sm' 
            : 'hover:bg-slate-800 text-slate-300'
        }}`;
        item.innerHTML = `
          <div class="truncate flex items-center gap-1.5">
            <span class="w-4 h-4 rounded-full flex items-center justify-center text-[9px] font-mono ${{isCurrent ? 'bg-white text-secondary' : 'bg-slate-700 text-slate-300'}}">${{idx + 1}}</span>
            <span class="truncate">${{st.label}}</span>
          </div>
          <span class="text-[10px] ${{isCurrent ? 'text-white/90' : 'text-slate-500'}} truncate">${{st.action}}</span>
        `;
        item.onclick = () => {{
          currentFlowStepIndex = idx;
          goToScreenByPascal(st.pascal);
          updateFlowUI();
          scrollToStepButton(st);
        }};
        container.appendChild(item);
      }});

      const tag = document.getElementById('current-flow-step-tag');
      tag.textContent = `Bước ${{currentFlowStepIndex + 1}}/${{fl.steps.length}}`;
      tag.classList.remove('hidden');
    }}

    function stepFlow(delta) {{
      const fl = FLOWS[currentFlowIndex];
      if (!fl) return;
      let newIdx = currentFlowStepIndex + delta;
      if (newIdx >= 0 && newIdx < fl.steps.length) {{
        currentFlowStepIndex = newIdx;
        const targetStep = fl.steps[currentFlowStepIndex];
        goToScreenByPascal(targetStep.pascal);
        updateFlowUI();
        scrollToStepButton(targetStep);
      }}
    }}

    function setTab(tab) {{
      activeTab = tab;
      ['all', 'part_a', 'part_b', 'part_c', 'part_d'].forEach(t => {{
        const btn = document.getElementById('tab-' + t);
        if (!btn) return;
        if (t === tab) {{
          btn.className = "py-1 text-[10px] font-semibold rounded bg-primary text-white truncate";
        }} else {{
          btn.className = "py-1 text-[10px] font-semibold rounded bg-slate-800 text-slate-300 hover:bg-slate-700 truncate";
        }}
      }});
      renderSidebar();
    }}

    function filterScreens() {{
      renderSidebar();
    }}

    function renderSidebar() {{
      const query = (document.getElementById('search-input').value || '').toLowerCase();
      const container = document.getElementById('screens-container');
      container.innerHTML = '';

      SCREENS.forEach((sc, idx) => {{
        const isPartA = sc.page.includes('Part A');
        const isPartB = sc.page.includes('Part B');
        const isPartC = sc.page.includes('Part C');
        const isPartD = sc.page.includes('Part D');

        if (activeTab === 'part_a' && !isPartA) return;
        if (activeTab === 'part_b' && !isPartB) return;
        if (activeTab === 'part_c' && !isPartC) return;
        if (activeTab === 'part_d' && !isPartD) return;

        if (query && !sc.name.toLowerCase().includes(query) && !sc.pascal_name.toLowerCase().includes(query)) {{
          return;
        }}

        const btn = document.createElement('button');
        const isActive = idx === currentIndex;
        btn.className = `w-full text-left p-2 rounded-lg text-xs transition flex items-center justify-between group ${{
          isActive 
            ? 'bg-primary text-white font-semibold shadow-md' 
            : 'hover:bg-slate-800/80 text-slate-300'
        }}`;

        btn.innerHTML = `
          <div class="truncate">
            <div class="font-medium truncate">${{sc.name}}</div>
            <div class="text-[10px] ${{isActive ? 'text-primary-100' : 'text-slate-400'}} truncate">${{sc.page.split('—')[0].trim()}}</div>
          </div>
          <span class="text-[10px] px-1.5 py-0.5 rounded ${{isActive ? 'bg-white/20 text-white' : 'bg-slate-800 text-slate-400 group-hover:bg-slate-700'}} font-mono">
            ${{sc.interactions.length}}
          </span>
        `;
        btn.onclick = () => loadScreen(idx);
        container.appendChild(btn);
      }});
    }}

    function goToScreenByPascal(pascal) {{
      const foundIdx = SCREENS.findIndex(s => s.pascal_name === pascal);
      if (foundIdx !== -1) {{
        loadScreen(foundIdx);
      }}
    }}

    // Screens without bottom navigation (Onboarding, Auth, Video/Audio Player, Focus Mode)
    const NO_NAV_SCREENS = new Set([
      'A01SharedSignIn',
      'A02LearnerRegistration',
      'S01Splash',
      'S02FeatureIntroduction',
      'S03SelectLearningGoal',
      'S04SelectInterests',
      'S05SelectCurrentLevel',
      'S06SetDailyStudyTime',
      'S07PlacementTestAssessment',
      'S08PlacementResults',
      'S09SuggestedLearningPath',
      'S36VideoPlayer',
      'S37AudioLesson',
      'S44FocusMode'
    ]);

    function getActiveNavTab(pascal) {{
      const homeScreens = new Set([
        'S10LearnerHome', 'S11TodaySStudyPlan', 'S12StudyStreak', 'S13WeeklyGoals',
        'S14LearningStatistics', 'S15Badges', 'S16LevelAndXp', 'S17DailyQuests',
        'S20SkillTree', 'S21AchievementSharingCard'
      ]);
      const exploreScreens = new Set([
        'S25Explore', 'S26CourseCategories', 'S27Search', 'S28AdvancedFilters',
        'S29SearchResults', 'S30CourseDetails', 'S31Syllabus', 'S32InstructorProfile',
        'S33CourseReviews', 'S34CompareCourses', 'S35LessonPreview'
      ]);
      const coursesScreens = new Set([
        'S38ReadingLesson', 'S39XemSlide', 'S40TimestampedVideoNotes',
        'S41DictionaryLookup', 'S42ManageOfflineDownloads', 'S43LessonPlaylist',
        'S45ChooseCohortSchedule', 'S46MyCourses', 'S47CourseProgressDetails',
        'S48NextCourseRecommendations',
        'S49MultipleChoiceQuiz', 'S50TrueFalseSwipeCards', 'S51FillInTheBlanks',
        'S52ReorderSequence', 'S53MatchingPairs', 'S54ListeningComprehension',
        'S55PronunciationRecording', 'S56EssayWriting', 'S57CodingExercise',
        'S58Flashcard', 'S59SpacedRepetitionSchedule', 'S60MyVocabulary',
        'S61TimedExam', 'S62ReviewAnswers', 'S63ExamResults', 'S64WeaknessAnalysis',
        'S65SubmitAssignment', 'S66AssignmentQueue', 'S67GradesAndFeedback',
        'S68Gradebook', 'S69Certificates', 'S70Leaderboard', 'S711v1Challenge', 'S72ReviewMiniGame'
      ]);
      const communityScreens = new Set([
        'S73LiveClassWaitingRoom', 'S74VideoClassroom', 'S75SharedWhiteboard',
        'S76InClassQA', 'S77StudySchedule', 'S78SessionDetails', 'S79Forum',
        'S80DiscussionThread', 'S81CreatePost', 'S82StudyGroups', 'S83GroupChat',
        'S84FindStudyBuddies', 'S85BookA1On1Mentor', 'S86LearnerProfile',
        'S87Notifications', 'S88Inbox'
      ]);
      const profileScreens = new Set([
        'S18PersonalProfile', 'S19EditProfile', 'S22LearningSettings',
        'S23StudyReminders', 'S24DisplayAndAccessibility',
        'S89CourseCheckout', 'S90PaymentMethods', 'S91PremiumPlan',
        'S92PromoCodes', 'S93TransactionHistory', 'S94Invoice',
        'S95InviteFriends', 'S96HelpCenter'
      ]);

      if (homeScreens.has(pascal)) return 'home';
      if (exploreScreens.has(pascal)) return 'explore';
      if (coursesScreens.has(pascal)) return 'courses';
      if (communityScreens.has(pascal)) return 'community';
      if (profileScreens.has(pascal)) return 'profile';
      return 'courses';
    }}

    function renderPinnedBottomNav(sc) {{
      const nav = document.getElementById('pinned-bottom-nav');
      if (!nav) return;

      const currentTab = getActiveNavTab(sc.pascal_name);

      const tabs = [
        {{ id: 'home', label: 'Home', icon: 'home', target: 'S10LearnerHome', isInternal: true }},
        {{ id: 'explore', label: 'Explore', icon: 'explore', target: 'S25Explore', isInternal: true }},
        {{ id: 'courses', label: 'Courses', icon: 'menu_book', target: 'S46MyCourses', isInternal: true }},
        {{ id: 'community', label: 'Community', icon: 'groups', target: 'S79Forum', isInternal: true }},
        {{ id: 'profile', label: 'Profile', icon: 'person', target: 'S18PersonalProfile', isInternal: true }}
      ];

      nav.innerHTML = tabs.map(tab => {{
        const isActive = tab.id === currentTab;
        const pillBg = isActive ? 'bg-[#EDE9FE]' : 'bg-transparent';
        const textColor = isActive ? 'text-[#2A14B4] font-bold' : 'text-slate-500 font-medium hover:text-slate-800';
        const iconColor = isActive ? 'text-[#2A14B4]' : 'text-slate-500';

        return `
          <button
            type="button"
            id="pinned-nav-tab-${{tab.id}}"
            onclick="onPinnedNavClick(event, '${{tab.target}}', ${{tab.isInternal}}, '${{tab.toastMsg || ''}}')"
            class="flex flex-col items-center justify-center flex-1 h-full py-1 transition-all group focus:outline-none relative select-none"
            title="${{tab.label}}"
          >
            <div class="px-3.5 py-1 rounded-full ${{pillBg}} flex items-center justify-center transition-colors">
              <span class="material-symbols-outlined text-[21px] ${{iconColor}} transition-transform group-active:scale-90">${{tab.icon}}</span>
            </div>
            <span class="text-[10px] mt-0.5 tracking-tight ${{textColor}}">${{tab.label}}</span>
          </button>
        `;
      }}).join('');
    }}

    function onPinnedNavClick(event, target, isInternal, toastMsg) {{
      if (event) {{
        showTapRipple(event.clientX, event.clientY);
      }}
      if (isInternal) {{
        goToScreenByPascal(target);
      }} else {{
        showToast(toastMsg || 'Chuyển tiếp sang mô-đun liên kết');
      }}
    }}

    function loadScreen(index) {{
      if (index < 0 || index >= SCREENS.length) return;
      currentIndex = index;
      const sc = SCREENS[index];

      // Update badge & details
      document.getElementById('current-screen-badge').textContent = sc.name;
      document.getElementById('meta-size').textContent = `${{Math.round(sc.width)}} x ${{Math.round(sc.height)}} px`;
      document.getElementById('meta-node-id').textContent = sc.id;
      document.getElementById('meta-page').textContent = sc.page.split('—')[0].trim();
      document.getElementById('interactions-count-badge').textContent = sc.interactions.length;

      // Check if screen has bottom navigation
      const hasNav = !NO_NAV_SCREENS.has(sc.pascal_name);
      const navEl = document.getElementById('pinned-bottom-nav');
      if (hasNav) {{
        navEl.classList.remove('hidden');
        renderPinnedBottomNav(sc);
      }} else {{
        navEl.classList.add('hidden');
      }}

      // Update Phone Viewport
      const viewportTarget = document.getElementById('screen-render-target');
      viewportTarget.innerHTML = '';

      const rawHeight = Math.round(sc.height || 844);

      // Create Screen Container với min-height chuẩn để scrollHeight sẵn sàng 100%
      const imgContainer = document.createElement('div');
      imgContainer.className = "relative w-[390px]";
      
      if (hasNav) {{
        // Cắt bỏ 64px tĩnh ở đáy ảnh Figma để nhường chỗ hoàn toàn cho thanh bottom nav cố định
        imgContainer.style.height = (rawHeight - 64) + "px";
        imgContainer.style.overflow = "hidden";
      }} else {{
        imgContainer.style.height = "auto";
        imgContainer.style.minHeight = rawHeight + "px";
        imgContainer.style.overflow = "visible";
      }}

      // Create Image
      const img = document.createElement('img');
      img.src = `./images/${{sc.pascal_name}}.png`;
      img.alt = sc.name;
      img.className = "w-[390px] h-auto block select-none pointer-events-none";
      img.style.minHeight = rawHeight + "px";

      // Khi ảnh tải xong, gắn các Hotspots chuẩn tỷ lệ pixel
      img.onload = () => {{
        renderHotspots(sc, imgContainer, hasNav, rawHeight);
      }};

      imgContainer.appendChild(img);
      viewportTarget.appendChild(imgContainer);

      // Scroll phone to top khi mở màn hình mới
      document.getElementById('phone-screen-viewport').scrollTop = 0;

      // Update Right Sidebar Interactions
      renderInteractions(sc);
      renderSidebar();

      // Đồng bộ màu thanh Status Bar theo nền màn hình
      const statusBar = document.getElementById('phone-status-bar');
      const statusTime = document.getElementById('status-time');
      const statusIcons = document.getElementById('status-icons');
      if (statusBar && statusTime && statusIcons) {{
        if (sc.pascal_name === 'S01Splash') {{
          statusBar.style.backgroundColor = '#3626bf';
          statusBar.style.borderColor = 'rgba(255,255,255,0.12)';
          statusTime.className = "text-[12px] font-semibold text-white tracking-tight font-sans pl-1";
          statusIcons.className = "flex items-center gap-1.5 text-white pr-1";
        }} else {{
          statusBar.style.backgroundColor = '#F9F9FF';
          statusBar.style.borderColor = 'rgba(226,232,248,0.7)';
          statusTime.className = "text-[12px] font-semibold text-slate-800 tracking-tight font-sans pl-1";
          statusIcons.className = "flex items-center gap-1.5 text-slate-800 pr-1";
        }}
      }}
    }}

    function renderHotspots(sc, container, hasNav, rawHeight) {{
      // Xóa hotspots cũ nếu có
      container.querySelectorAll('.hotspot-overlay').forEach(el => el.remove());

      if (!sc.hotspots || sc.hotspots.length === 0) return;

      const scale = getScreenScale();

      sc.hotspots.forEach(hs => {{
        // Bỏ qua các hotspot nằm trong 64px đáy vì thanh pinned-bottom-nav đã xử lý trực tiếp
        if (hasNav && hs.y >= rawHeight - 64) {{
          return;
        }}
        const spot = document.createElement('div');
        spot.className = "hotspot-overlay";
        spot.style.left = Math.round(hs.x * scale) + 'px';
        spot.style.top = Math.round(hs.y * scale) + 'px';
        spot.style.width = Math.round(hs.w * scale) + 'px';
        spot.style.height = Math.round(hs.h * scale) + 'px';
        spot.title = `Bấm để chuyển: ${{hs.target_title}} (${{hs.layer}})`;
        
        spot.onclick = (e) => {{
          e.stopPropagation();
          showTapRipple(e.clientX, e.clientY);
          handleNavigation(hs.target_pascal, hs.target_title, hs.target_page, hs.is_internal);
        }};

        container.appendChild(spot);
      }});
    }}

    function renderInteractions(sc) {{
      const container = document.getElementById('interactions-list');
      container.innerHTML = '';

      if (!sc.interactions || sc.interactions.length === 0) {{
        container.innerHTML = `
          <div class="p-4 rounded-xl bg-slate-800/40 border border-slate-700/50 text-center">
            <span class="material-symbols-outlined text-slate-500 text-2xl">flag</span>
            <div class="text-xs text-slate-400 font-medium mt-1">Điểm kết thúc hoặc hiển thị tĩnh</div>
            <div class="text-[11px] text-slate-500 mt-0.5">Không có prototype link ra ngoài</div>
          </div>
        `;
        return;
      }}

      const seen = new Set();
      sc.interactions.forEach(inter => {{
        const dest = inter.destination_pascal;
        const key = inter.source_layer + '->' + dest;
        if (seen.has(key)) return;
        seen.add(key);

        const card = document.createElement('div');
        const isBack = dest === 'GoBack';
        const isInternal = inter.is_internal;

        card.className = "p-2.5 rounded-xl bg-slate-800/60 hover:bg-slate-800 border border-slate-700/80 hover:border-secondary/60 transition cursor-pointer group";

        card.innerHTML = `
          <div class="flex items-center justify-between text-[10px] text-slate-400 mb-1">
            <span class="px-1.5 py-0.5 rounded bg-slate-700 text-slate-300 font-semibold uppercase">${{inter.trigger || 'ON_CLICK'}}</span>
            <span class="${{isInternal ? 'text-secondary' : 'text-indigo-400'}} font-medium group-hover:underline flex items-center gap-0.5">
              ${{isInternal ? 'Chuyển tiếp' : 'Cross-Part'}} <span class="material-symbols-outlined text-xs">arrow_forward</span>
            </span>
          </div>
          <div class="font-semibold text-xs text-white group-hover:text-secondary transition truncate">
            ${{inter.source_layer || inter.destination_title}}
          </div>
          <div class="text-[11px] text-slate-400 mt-0.5 flex items-center gap-1 truncate">
            <span class="material-symbols-outlined text-xs ${{isBack ? 'text-slate-400' : (isInternal ? 'text-secondary' : 'text-indigo-400')}}">
              ${{isBack ? 'arrow_back' : (isInternal ? 'smartphone' : 'open_in_new')}}
            </span>
            ${{isBack ? 'Quay lại màn hình trước' : inter.destination_title}}
          </div>
        `;

        card.onclick = (e) => {{
          showTapRipple(e.clientX, e.clientY);
          handleNavigation(dest, inter.destination_title, inter.destination_page, isInternal);
        }};

        container.appendChild(card);
      }});
    }}

    function handleNavigation(destPascal, destTitle, destPage, isInternal) {{
      if (destPascal === 'GoBack') {{
        goPrevScreen();
      }} else if (isInternal) {{
        goToScreenByPascal(destPascal);
      }} else {{
        showToast(`Chuyển tiếp sang: ${{destTitle}} (${{destPage || 'Figma Module'}})`);
      }}
    }}

    function showToast(msg) {{
      const toast = document.getElementById('toast-notification');
      document.getElementById('toast-text').textContent = msg;
      toast.classList.remove('opacity-0', 'pointer-events-none', 'translate-y-3');
      toast.classList.add('opacity-100', 'translate-y-0');
      setTimeout(() => {{
        toast.classList.add('opacity-0', 'pointer-events-none', 'translate-y-3');
        toast.classList.remove('opacity-100', 'translate-y-0');
      }}, 3200);
    }}

    function showTapRipple(x, y) {{
      const ripple = document.createElement('div');
      ripple.className = 'tap-ripple';
      ripple.style.left = x + 'px';
      ripple.style.top = y + 'px';
      document.body.appendChild(ripple);
      setTimeout(() => ripple.remove(), 600);
    }}

    function goPrevScreen() {{
      if (currentIndex > 0) loadScreen(currentIndex - 1);
    }}

    function goNextScreen() {{
      if (currentIndex < SCREENS.length - 1) loadScreen(currentIndex + 1);
    }}

    // =========================================================================
    // AUTO DEMO ENGINE: BẤM CHUẨN XÁC VÀO TỌA ĐỘ NÚT BẰNG GETSCREENSCALE()
    // =========================================================================
    function toggleAutoDemo() {{
      isAutoDemo = !isAutoDemo;
      const btn = document.getElementById('auto-demo-btn');
      const text = document.getElementById('auto-demo-text');
      if (isAutoDemo) {{
        btn.className = "h-8 px-3 rounded-lg bg-red-600 hover:bg-red-700 text-white text-xs font-semibold flex items-center gap-1.5 shadow-md animate-pulse";
        text.textContent = "Dừng Auto Demo";
        runPreciseAutoDemoStep();
      }} else {{
        btn.className = "h-8 px-3 rounded-lg bg-secondary hover:bg-secondary/90 text-white text-xs font-semibold flex items-center gap-1.5 shadow-md transition";
        text.textContent = "Chạy Demo Luồng Này";
        clearTimeout(autoDemoTimer);
        removeDemoOverlays();
      }}
    }}

    function getTabFromBtnX(x) {{
      if (x < 78) return 'home';
      if (x < 156) return 'explore';
      if (x < 234) return 'courses';
      if (x < 312) return 'community';
      return 'profile';
    }}

    // Tự động lướt màn hình mượt mà đến đúng khu vực nút bấm (không bị bấm ngầm)
    function scrollToStepButton(step, onDone) {{
      if (!step) {{
        if (onDone) onDone();
        return;
      }}
      const sc = SCREENS[currentIndex];
      const hasNav = !NO_NAV_SCREENS.has(sc.pascal_name);
      const rawHeight = Math.round(sc.height || 844);
      const btnY = step.btn_y || 400.0;

      // Nếu nút nằm trên thanh nav bar đã ghim cố định ở đáy, không cần cuộn
      if (hasNav && btnY >= rawHeight - 64) {{
        if (onDone) onDone();
        return;
      }}

      const scale = getScreenScale();
      const viewport = document.getElementById('phone-screen-viewport');
      if (!viewport) {{
        if (onDone) onDone();
        return;
      }}

      const viewportH = viewport.clientHeight || 686;
      // Căn vị trí cuộn sao cho nút bấm hiển thị ở 40% khung nhìn (trước tầm mắt người xem)
      const targetScroll = Math.max(0, Math.round((btnY * scale) - (viewportH * 0.40)));
      const dist = Math.abs(viewport.scrollTop - targetScroll);

      if (dist > 25) {{
        // LƯỚT MƯỢT MÀ TỚI KHU VỰC CÓ NÚT
        viewport.scrollTo({{ top: targetScroll, behavior: 'smooth' }});
        // Thời gian chờ tỷ lệ với khoảng cách lướt để người dùng thấy rõ chuyển động
        const scrollWait = Math.min(650, Math.max(380, Math.round(dist * 0.45)));
        setTimeout(() => {{
          if (onDone) onDone();
        }}, scrollWait);
      }} else {{
        if (onDone) onDone();
      }}
    }}

    function runPreciseAutoDemoStep() {{
      if (!isAutoDemo) return;
      const fl = FLOWS[currentFlowIndex];
      if (!fl) return;

      const currentStep = fl.steps[currentFlowStepIndex];
      const isNewScreen = (SCREENS[currentIndex].pascal_name !== currentStep.pascal);

      // 1. Nếu là màn hình mới, nạp màn hình trước
      if (isNewScreen) {{
        goToScreenByPascal(currentStep.pascal);
      }}

      // Đợi 280ms để người dùng kịp nhìn thấy tiêu đề / đỉnh màn hình mới
      const preWait = isNewScreen ? 280 : 60;

      setTimeout(() => {{
        if (!isAutoDemo) return;

        // 2. LƯỚT MÀN HÌNH TỚI VỊ TRÍ NÚT BẤM (Cho người xem thấy rõ nút xuất hiện)
        scrollToStepButton(currentStep, () => {{
          if (!isAutoDemo) return;

          const scale = getScreenScale();
          const btnX = currentStep.btn_x || 195.0;
          const btnY = currentStep.btn_y || 400.0;
          const btnW = currentStep.btn_w || 340.0;
          const btnH = currentStep.btn_h || 48.0;

          // 3. Sau khi màn hình đã lướt tới nơi, hiện con trỏ và khung viền bấm chính xác
          highlightButtonAndClick(btnX, btnY, btnW, btnH, currentStep.action, () => {{
            currentFlowStepIndex = (currentFlowStepIndex + 1) % fl.steps.length;
            updateFlowUI();
            autoDemoTimer = setTimeout(runPreciseAutoDemoStep, 800);
          }});
        }});
      }}, preWait);
    }}

    function highlightButtonAndClick(x, y, w, h, actionName, onFinish) {{
      const sc = SCREENS[currentIndex];
      const hasNav = !NO_NAV_SCREENS.has(sc.pascal_name);
      const rawHeight = Math.round(sc.height || 844);

      // Nếu hành động bấm vào thanh nav bar ghim cố định
      if (hasNav && y >= rawHeight - 64) {{
        const tabId = getTabFromBtnX(x);
        const tabBtn = document.getElementById(`pinned-nav-tab-${{tabId}}`);
        if (tabBtn) {{
          highlightNavTabAndClick(tabBtn, actionName, onFinish);
          return;
        }}
      }}

      const renderTarget = document.getElementById('screen-render-target');
      removeDemoOverlays();

      const scale = getScreenScale();
      const realX = Math.round(x * scale);
      const realY = Math.round(y * scale);
      const realW = Math.round(w * scale);
      const realH = Math.round(h * scale);

      // Hộp viền phát sáng bao quanh nút bấm
      const box = document.createElement('div');
      box.className = 'auto-demo-box';
      box.id = 'demo-active-box';
      box.style.left = Math.round(realX - realW / 2) + 'px';
      box.style.top = Math.round(realY - realH / 2) + 'px';
      box.style.width = realW + 'px';
      box.style.height = realH + 'px';
      renderTarget.appendChild(box);

      // Con trỏ chạm tay
      const pointer = document.createElement('div');
      pointer.className = 'auto-demo-pointer';
      pointer.id = 'demo-active-pointer';
      pointer.style.left = realX + 'px';
      pointer.style.top = Math.round(realY - 32) + 'px';
      pointer.innerHTML = `
        <div class="relative">
          <span class="material-symbols-outlined text-secondary text-2xl drop-shadow-lg">touch_app</span>
          <div class="absolute left-6 -top-1 bg-slate-900/95 text-white text-[10px] font-semibold px-2 py-0.5 rounded shadow border border-secondary whitespace-nowrap">
            ${{actionName}}
          </div>
        </div>
      `;
      renderTarget.appendChild(pointer);

      // Hạ con trỏ xuống để mô phỏng động tác bấm
      setTimeout(() => {{
        pointer.style.top = realY + 'px';
        
        // Kích hoạt ripple gợn sóng ngay tâm nút
        const viewport = document.getElementById('phone-screen-viewport');
        const vRect = viewport.getBoundingClientRect();
        const screenX = vRect.left + realX;
        const screenY = vRect.top + (realY - viewport.scrollTop);
        showTapRipple(screenX, screenY);

        setTimeout(() => {{
          removeDemoOverlays();
          if (onFinish) onFinish();
        }}, 650);
      }}, 400);
    }}

    function highlightNavTabAndClick(tabBtn, actionName, onFinish) {{
      removeDemoOverlays();
      const rect = tabBtn.getBoundingClientRect();
      const phoneFrame = document.getElementById('phone-screen-frame');
      const frameRect = phoneFrame.getBoundingClientRect();

      const relX = rect.left - frameRect.left + rect.width / 2;
      const relY = rect.top - frameRect.top + rect.height / 2;

      const box = document.createElement('div');
      box.className = 'auto-demo-box';
      box.id = 'demo-active-box';
      box.style.left = Math.round(rect.left - frameRect.left + 4) + 'px';
      box.style.top = Math.round(rect.top - frameRect.top + 4) + 'px';
      box.style.width = Math.round(rect.width - 8) + 'px';
      box.style.height = Math.round(rect.height - 8) + 'px';
      phoneFrame.appendChild(box);

      const pointer = document.createElement('div');
      pointer.className = 'auto-demo-pointer';
      pointer.id = 'demo-active-pointer';
      pointer.style.left = Math.round(relX) + 'px';
      pointer.style.top = Math.round(relY - 32) + 'px';
      pointer.innerHTML = `
        <div class="relative">
          <span class="material-symbols-outlined text-secondary text-2xl drop-shadow-lg">touch_app</span>
          <div class="absolute left-6 -top-1 bg-slate-900/95 text-white text-[10px] font-semibold px-2 py-0.5 rounded shadow border border-secondary whitespace-nowrap z-50">
            ${{actionName}}
          </div>
        </div>
      `;
      phoneFrame.appendChild(pointer);

      setTimeout(() => {{
        pointer.style.top = Math.round(relY) + 'px';
        showTapRipple(rect.left + rect.width / 2, rect.top + rect.height / 2);

        setTimeout(() => {{
          removeDemoOverlays();
          if (onFinish) onFinish();
        }}, 650);
      }}, 400);
    }}

    function removeDemoOverlays() {{
      const b = document.getElementById('demo-active-box');
      if (b) b.remove();
      const p = document.getElementById('demo-active-pointer');
      if (p) p.remove();
    }}

    // Screen Recording
    async function toggleScreenRecord() {{
      const btn = document.getElementById('record-btn');
      if (mediaRecorder && mediaRecorder.state === 'recording') {{
        mediaRecorder.stop();
        btn.className = "h-8 px-3 rounded-lg bg-red-500/15 hover:bg-red-500/25 border border-red-500/40 text-red-400 text-xs font-semibold flex items-center gap-1.5 transition";
        btn.querySelector('span:last-child').textContent = "Quay video Demo";
        return;
      }}

      try {{
        const stream = await navigator.mediaDevices.getDisplayMedia({{
          video: {{ cursor: "always", displaySurface: "browser" }},
          audio: false
        }});
        recordedChunks = [];
        mediaRecorder = new MediaRecorder(stream, {{ mimeType: 'video/webm;codecs=vp9' }});
        mediaRecorder.ondataavailable = (e) => {{ if (e.data.size > 0) recordedChunks.push(e.data); }};
        mediaRecorder.onstop = () => {{
          const blob = new Blob(recordedChunks, {{ type: 'video/webm' }});
          const url = URL.createObjectURL(blob);
          const a = document.createElement('a');
          a.href = url;
          a.download = `EduPath_Prototype_Flow_${{FLOWS[currentFlowIndex].id}}.webm`;
          document.body.appendChild(a);
          a.click();
          document.body.removeChild(a);
          URL.revokeObjectURL(url);
          stream.getTracks().forEach(t => t.stop());
        }};
        mediaRecorder.start();
        btn.className = "h-8 px-3 rounded-lg bg-red-600 text-white text-xs font-semibold flex items-center gap-1.5 shadow-md animate-pulse";
        btn.querySelector('span:last-child').textContent = "Đang quay... (Bấm dừng)";
      }} catch (err) {{
        console.error("Lỗi ghi hình:", err);
      }}
    }}

    // Code Modal
    function openCodeModal() {{
      const sc = SCREENS[currentIndex];
      document.getElementById('modal-screen-title').textContent = `${{sc.name}} (${{sc.pascal_name}})`;
      updateCodeSnippet();
      document.getElementById('code-modal').classList.remove('hidden');
    }}

    function closeCodeModal() {{
      document.getElementById('code-modal').classList.add('hidden');
    }}

    function switchCodeTab(tab) {{
      activeCodeTab = tab;
      const btnFl = document.getElementById('code-tab-flutter');
      const btnRn = document.getElementById('code-tab-rn');
      if (tab === 'flutter') {{
        btnFl.className = "px-3 py-1 font-semibold rounded bg-primary text-white";
        btnRn.className = "px-3 py-1 font-semibold rounded text-slate-400 hover:text-white";
      }} else {{
        btnFl.className = "px-3 py-1 font-semibold rounded text-slate-400 hover:text-white";
        btnRn.className = "px-3 py-1 font-semibold rounded bg-primary text-white";
      }}
      updateCodeSnippet();
    }}

    function updateCodeSnippet() {{
      const sc = SCREENS[currentIndex];
      const code = activeCodeTab === 'flutter' ? sc.flutter_code : sc.rn_code;
      document.getElementById('code-snippet').textContent = code || '// Đang nạp mã nguồn...';
    }}

    function copyCurrentCode() {{
      const sc = SCREENS[currentIndex];
      const code = activeCodeTab === 'flutter' ? sc.flutter_code : sc.rn_code;
      navigator.clipboard.writeText(code).then(() => {{
        const btnTxt = document.getElementById('copy-btn-text');
        btnTxt.textContent = "Đã chép!";
        setTimeout(() => btnTxt.textContent = "Sao chép", 1800);
      }});
    }}
  </script>
</body>
</html>
"""

index_path = os.path.join(output_dir, "index.html")
with open(index_path, "w", encoding="utf-8") as f:
    f.write(html_content)
print(f"[+] Đã tạo xong Trình mô phỏng Web Prototype tại: {index_path}")

web_viewer_index = os.path.join(root_dir, "frontend", "web_viewer", "index.html")
with open(web_viewer_index, "w", encoding="utf-8") as f:
    f.write(html_content)
print(f"[+] Đã đồng bộ sang frontend/web_viewer/index.html: {web_viewer_index}")
