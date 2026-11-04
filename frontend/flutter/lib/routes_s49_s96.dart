import 'package:flutter/material.dart';

import 'screens/s49_multiple_choice_quiz.dart';
import 'screens/s50_true_false_swipe_cards.dart';
import 'screens/s51_fill_in_the_blanks.dart';
import 'screens/s52_reorder_sequence.dart';
import 'screens/s53_matching_pairs.dart';
import 'screens/s54_listening_comprehension.dart';
import 'screens/s55_speaking_pronunciation.dart';
import 'screens/s56_essay_writing.dart';
import 'screens/s57_coding_exercise.dart';
import 'screens/s58_flashcards.dart';
import 'screens/s59_spaced_repetition_schedule.dart';
import 'screens/s60_my_vocabulary.dart';
import 'screens/s61_timed_exam.dart';
import 'screens/s62_review_answers.dart';
import 'screens/s63_exam_results.dart';
import 'screens/s64_weakness_analysis.dart';
import 'screens/s65_assignment_submission.dart';
import 'screens/s66_assignment_queue.dart';
import 'screens/s67_grades_instructor_feedback.dart';
import 'screens/s68_academic_gradebook.dart';
import 'screens/s69_certificate_of_completion.dart';
import 'screens/s70_leaderboard_rankings.dart';
import 'screens/s71_1v1_challenge_duel.dart';
import 'screens/s72_word_rain_review_game.dart';
import 'screens/s73_live_class_waiting_room.dart';
import 'screens/s74_live_video_classroom.dart';
import 'screens/s75_shared_whiteboard.dart';
import 'screens/s76_in_class_q_a.dart';
import 'screens/s77_study_schedule_calendar.dart';
import 'screens/s78_session_details.dart';
import 'screens/s79_community_forum.dart';
import 'screens/s80_discussion_thread.dart';
import 'screens/s81_create_post.dart';
import 'screens/s82_study_groups.dart';
import 'screens/s83_group_chat.dart';
import 'screens/s84_study_buddy_matchmaker.dart';
import 'screens/s85_book_1_on_1_mentor.dart';
import 'screens/s86_peer_profile.dart';
import 'screens/s87_notifications.dart';
import 'screens/s88_messages.dart';
import 'screens/s89_course_checkout.dart';
import 'screens/s90_payment_methods.dart';
import 'screens/s91_premium_subscription.dart';
import 'screens/s92_promo_codes_vouchers.dart';
import 'screens/s93_transaction_history.dart';
import 'screens/s94_invoice_details_tax_receipt.dart';
import 'screens/s95_invite_friends_earn_rewards.dart';
import 'screens/s96_help_support_center.dart';

final Map<String, WidgetBuilder> s49S96Routes = {
  '/s49_multiple_choice_quiz': (context) => const S49MultipleChoiceQuizScreen(),
  '/s50_true_false_swipe_cards': (context) => const S50TrueFalseSwipeCardsScreen(),
  '/s51_fill_in_the_blanks': (context) => const S51FillInTheBlanksScreen(),
  '/s52_reorder_sequence': (context) => const S52ReorderSequenceScreen(),
  '/s53_matching_pairs': (context) => const S53MatchingPairsScreen(),
  '/s54_listening_comprehension': (context) => const S54ListeningComprehensionScreen(),
  '/s55_speaking_pronunciation': (context) => const S55SpeakingPronunciationScreen(),
  '/s56_essay_writing': (context) => const S56EssayWritingScreen(),
  '/s57_coding_exercise': (context) => const S57CodingExerciseScreen(),
  '/s58_flashcards': (context) => const S58FlashcardsScreen(),
  '/s59_spaced_repetition_schedule': (context) => const S59SpacedRepetitionScheduleScreen(),
  '/s60_my_vocabulary': (context) => const S60MyVocabularyScreen(),
  '/s61_timed_exam': (context) => const S61TimedExamScreen(),
  '/s62_review_answers': (context) => const S62ReviewAnswersScreen(),
  '/s63_exam_results': (context) => const S63ExamResultsScreen(),
  '/s64_weakness_analysis': (context) => const S64WeaknessAnalysisScreen(),
  '/s65_assignment_submission': (context) => const S65AssignmentSubmissionScreen(),
  '/s66_assignment_queue': (context) => const S66AssignmentQueueScreen(),
  '/s67_grades_instructor_feedback': (context) => const S67GradesInstructorFeedbackScreen(),
  '/s68_academic_gradebook': (context) => const S68AcademicGradebookScreen(),
  '/s69_certificate_of_completion': (context) => const S69CertificateOfCompletionScreen(),
  '/s70_leaderboard_rankings': (context) => const S70LeaderboardRankingsScreen(),
  '/s71_1v1_challenge_duel': (context) => const S711v1ChallengeDuelScreen(),
  '/s72_word_rain_review_game': (context) => const S72WordRainReviewGameScreen(),
  '/s73_live_class_waiting_room': (context) => const S73LiveClassWaitingRoomScreen(),
  '/s74_live_video_classroom': (context) => const S74LiveVideoClassroomScreen(),
  '/s75_shared_whiteboard': (context) => const S75SharedWhiteboardScreen(),
  '/s76_in_class_q_a': (context) => const S76InClassQAScreen(),
  '/s77_study_schedule_calendar': (context) => const S77StudyScheduleCalendarScreen(),
  '/s78_session_details': (context) => const S78SessionDetailsScreen(),
  '/s79_community_forum': (context) => const S79CommunityForumScreen(),
  '/s80_discussion_thread': (context) => const S80DiscussionThreadScreen(),
  '/s81_create_post': (context) => const S81CreatePostScreen(),
  '/s82_study_groups': (context) => const S82StudyGroupsScreen(),
  '/s83_group_chat': (context) => const S83GroupChatScreen(),
  '/s84_study_buddy_matchmaker': (context) => const S84StudyBuddyMatchmakerScreen(),
  '/s85_book_1_on_1_mentor': (context) => const S85Book1On1MentorScreen(),
  '/s86_peer_profile': (context) => const S86PeerProfileScreen(),
  '/s87_notifications': (context) => const S87NotificationsScreen(),
  '/s88_messages': (context) => const S88MessagesScreen(),
  '/s89_course_checkout': (context) => const S89CourseCheckoutScreen(),
  '/s90_payment_methods': (context) => const S90PaymentMethodsScreen(),
  '/s91_premium_subscription': (context) => const S91PremiumSubscriptionScreen(),
  '/s92_promo_codes_vouchers': (context) => const S92PromoCodesVouchersScreen(),
  '/s93_transaction_history': (context) => const S93TransactionHistoryScreen(),
  '/s94_invoice_details_tax_receipt': (context) => const S94InvoiceDetailsTaxReceiptScreen(),
  '/s95_invite_friends_earn_rewards': (context) => const S95InviteFriendsEarnRewardsScreen(),
  '/s96_help_support_center': (context) => const S96HelpSupportCenterScreen(),
};
