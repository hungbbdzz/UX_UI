with open('c:/Documents/Materials/UX UI/final/figmatoCode/frontend/flutter/lib/routes.dart', 'r', encoding='utf-8') as f:
    content = f.read()

target = "  '/s79forum': '/s79_community_forum',"
addition = """  '/s79forum': '/s79_community_forum',
  '/s58_flashcard': '/s58_flashcards',
  '/s58flashcard': '/s58_flashcards',
  '/s65_submit_assignment': '/s65_assignment_submission',
  '/s65submitassignment': '/s65_assignment_submission',
  '/s68_gradebook': '/s68_academic_gradebook',
  '/s68gradebook': '/s68_academic_gradebook',
  '/s69_certificates': '/s69_certificate_of_completion',
  '/s69certificates': '/s69_certificate_of_completion',
  '/s70_leaderboard': '/s70_leaderboard_rankings',
  '/s70leaderboard': '/s70_leaderboard_rankings',
  '/s77_study_schedule': '/s77_study_schedule_calendar',
  '/s77studyschedule': '/s77_study_schedule_calendar',
  '/s85_book_a_1_on_1_mentor': '/s85_book_1_on_1_mentor',
  '/s85booka1on1mentor': '/s85_book_1_on_1_mentor',
  '/s88_inbox': '/s88_messages',
  '/s88inbox': '/s88_messages',
  '/s91_premium_plan': '/s91_premium_subscription',
  '/s91premiumplan': '/s91_premium_subscription',
  '/s95_invite_friends': '/s95_invite_friends_earn_rewards',
  '/s95invitefriends': '/s95_invite_friends_earn_rewards',
  '/s96_help_center': '/s96_help_support_center',
  '/s96helpcenter': '/s96_help_support_center',
  '/a03instructorregistration': '/a01_shared_sign_in',
  '/a03_instructor_registration': '/a01_shared_sign_in',
  '/s97instructordashboard': '/s10_learner_home',
  '/s97_instructor_dashboard': '/s10_learner_home',"""

if target in content:
    content = content.replace(target, addition)
    with open('c:/Documents/Materials/UX UI/final/figmatoCode/frontend/flutter/lib/routes.dart', 'w', encoding='utf-8') as f:
        f.write(content)
    print("SUCCESS")
else:
    print("TARGET NOT FOUND")

