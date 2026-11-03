import 'package:flutter/material.dart';
import 'screens/s01_splash.dart';
import 'screens/s03_select_learning_goal.dart';
import 'screens/s04_select_interests.dart';
import 'screens/s02_feature_introduction.dart';
import 'screens/s06_set_daily_study_time.dart';
import 'screens/s08_placement_results.dart';
import 'screens/s05_select_current_level.dart';
import 'screens/s07_placement_test_assessment.dart';
import 'screens/s09_suggested_learning_path.dart';
import 'screens/s11_today_s_study_plan.dart';
import 'screens/s12_study_streak.dart';
import 'screens/s10_learner_home.dart';
import 'screens/s14_learning_statistics.dart';
import 'screens/s15_badges.dart';
import 'screens/s16_level_and_xp.dart';
import 'screens/s13_weekly_goals.dart';
import 'screens/s21_achievement_sharing_card.dart';
import 'screens/s22_learning_settings.dart';
import 'screens/s24_display_and_accessibility.dart';
import 'screens/s19_edit_profile.dart';
import 'screens/s18_personal_profile.dart';
import 'screens/s17_daily_quests.dart';
import 'screens/s20_skill_tree.dart';
import 'screens/s23_study_reminders.dart';
import 'screens/a01_shared_sign_in.dart';
import 'screens/a02_learner_registration.dart';
import 'screens/s25_explore.dart';
import 'screens/s26_course_categories.dart';
import 'screens/s27_search.dart';
import 'screens/s28_advanced_filters.dart';
import 'screens/s29_search_results.dart';
import 'screens/s31_syllabus.dart';
import 'screens/s30_course_details.dart';
import 'screens/s32_instructor_profile.dart';
import 'screens/s34_compare_courses.dart';
import 'screens/s35_lesson_preview.dart';
import 'screens/s33_course_reviews.dart';
import 'screens/s36_video_player.dart';
import 'screens/s37_audio_lesson.dart';
import 'screens/s38_reading_lesson.dart';
import 'screens/s39_xem_slide.dart';
import 'screens/s40_timestamped_video_notes.dart';
import 'screens/s42_manage_offline_downloads.dart';
import 'screens/s44_focus_mode.dart';
import 'screens/s41_dictionary_lookup.dart';
import 'screens/s43_lesson_playlist.dart';
import 'screens/s48_next_course_recommendations.dart';
import 'screens/s47_course_progress_details.dart';
import 'screens/s46_my_courses.dart';
import 'screens/s45_choose_cohort_schedule.dart';

/// Bản đồ định tuyến toàn bộ màn hình và liên kết Prototype Figma
final Map<String, WidgetBuilder> appRoutes = {
  '/s01_splash': (context) => const S01SplashScreen(),
  '/s03_select_learning_goal': (context) => const S03SelectLearningGoalScreen(),
  '/s04_select_interests': (context) => const S04SelectInterestsScreen(),
  '/s02_feature_introduction': (context) => const S02FeatureIntroductionScreen(),
  '/s06_set_daily_study_time': (context) => const S06SetDailyStudyTimeScreen(),
  '/s08_placement_results': (context) => const S08PlacementResultsScreen(),
  '/s05_select_current_level': (context) => const S05SelectCurrentLevelScreen(),
  '/s07_placement_test_assessment': (context) => const S07PlacementTestAssessmentScreen(),
  '/s09_suggested_learning_path': (context) => const S09SuggestedLearningPathScreen(),
  '/s11_today_s_study_plan': (context) => const S11TodaySStudyPlanScreen(),
  '/s12_study_streak': (context) => const S12StudyStreakScreen(),
  '/s10_learner_home': (context) => const S10LearnerHomeScreen(),
  '/s14_learning_statistics': (context) => const S14LearningStatisticsScreen(),
  '/s15_badges': (context) => const S15BadgesScreen(),
  '/s16_level_and_xp': (context) => const S16LevelAndXpScreen(),
  '/s13_weekly_goals': (context) => const S13WeeklyGoalsScreen(),
  '/s21_achievement_sharing_card': (context) => const S21AchievementSharingCardScreen(),
  '/s22_learning_settings': (context) => const S22LearningSettingsScreen(),
  '/s24_display_and_accessibility': (context) => const S24DisplayAndAccessibilityScreen(),
  '/s19_edit_profile': (context) => const S19EditProfileScreen(),
  '/s18_personal_profile': (context) => const S18PersonalProfileScreen(),
  '/s17_daily_quests': (context) => const S17DailyQuestsScreen(),
  '/s20_skill_tree': (context) => const S20SkillTreeScreen(),
  '/s23_study_reminders': (context) => const S23StudyRemindersScreen(),
  '/a01_shared_sign_in': (context) => const A01SharedSignInScreen(),
  '/a02_learner_registration': (context) => const A02LearnerRegistrationScreen(),
  '/s25_explore': (context) => const S25ExploreScreen(),
  '/s26_course_categories': (context) => const S26CourseCategoriesScreen(),
  '/s27_search': (context) => const S27SearchScreen(),
  '/s28_advanced_filters': (context) => const S28AdvancedFiltersScreen(),
  '/s29_search_results': (context) => const S29SearchResultsScreen(),
  '/s31_syllabus': (context) => const S31SyllabusScreen(),
  '/s30_course_details': (context) => const S30CourseDetailsScreen(),
  '/s32_instructor_profile': (context) => const S32InstructorProfileScreen(),
  '/s34_compare_courses': (context) => const S34CompareCoursesScreen(),
  '/s35_lesson_preview': (context) => const S35LessonPreviewScreen(),
  '/s33_course_reviews': (context) => const S33CourseReviewsScreen(),
  '/s36_video_player': (context) => const S36VideoPlayerScreen(),
  '/s37_audio_lesson': (context) => const S37AudioLessonScreen(),
  '/s38_reading_lesson': (context) => const S38ReadingLessonScreen(),
  '/s39_xem_slide': (context) => const S39XemSlideScreen(),
  '/s40_timestamped_video_notes': (context) => const S40TimestampedVideoNotesScreen(),
  '/s42_manage_offline_downloads': (context) => const S42ManageOfflineDownloadsScreen(),
  '/s44_focus_mode': (context) => const S44FocusModeScreen(),
  '/s41_dictionary_lookup': (context) => const S41DictionaryLookupScreen(),
  '/s43_lesson_playlist': (context) => const S43LessonPlaylistScreen(),
  '/s48_next_course_recommendations': (context) => const S48NextCourseRecommendationsScreen(),
  '/s47_course_progress_details': (context) => const S47CourseProgressDetailsScreen(),
  '/s46_my_courses': (context) => const S46MyCoursesScreen(),
  '/s45_choose_cohort_schedule': (context) => const S45ChooseCohortScheduleScreen()
};

const String initialRoute = '/s01_splash';
