import 'package:flutter/material.dart';
import 'routes_s49_s96.dart';
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
  '/s45_choose_cohort_schedule': (context) => const S45ChooseCohortScheduleScreen(),
  ...s49S96Routes,
};

/// Legacy aliases used by older S01-S48 screens (route names without
/// underscores, e.g. '/s02featureintroduction'). Anchors the S01-S48
/// navigation graph to the current route names.
final Map<String, String> _routeAliases = {
  for (final entry in appRoutes.entries)
    if (!entry.key.contains('_') || entry.key.length < 10)
      entry.key.replaceAll('_', ''): entry.key,
  '/s02featureintroduction': '/s02_feature_introduction',
  '/s03selectlearninggoal': '/s03_select_learning_goal',
  '/s04selectinterests': '/s04_select_interests',
  '/s05selectcurrentlevel': '/s05_select_current_level',
  '/s06setdailystudytime': '/s06_set_daily_study_time',
  '/s07placementtestassessment': '/s07_placement_test_assessment',
  '/s08placementresults': '/s08_placement_results',
  '/s09suggestedlearningpath': '/s09_suggested_learning_path',
  '/s10learnerhome': '/s10_learner_home',
  '/s11todaysstudyplan': '/s11_today_s_study_plan',
  '/s12studystreak': '/s12_study_streak',
  '/s13weeklygoals': '/s13_weekly_goals',
  '/s14learningstatistics': '/s14_learning_statistics',
  '/s15badges': '/s15_badges',
  '/s16levelandxp': '/s16_level_and_xp',
  '/s17dailyquests': '/s17_daily_quests',
  '/s18personalprofile': '/s18_personal_profile',
  '/s19editprofile': '/s19_edit_profile',
  '/s20skilltree': '/s20_skill_tree',
  '/s21achievementsharingcard': '/s21_achievement_sharing_card',
  '/s22learningsettings': '/s22_learning_settings',
  '/s23studyreminders': '/s23_study_reminders',
  '/s24displayandaccessibility': '/s24_display_and_accessibility',
  '/s25explore': '/s25_explore',
  '/s26coursecategories': '/s26_course_categories',
  '/s27search': '/s27_search',
  '/s28advancedfilters': '/s28_advanced_filters',
  '/s29searchresults': '/s29_search_results',
  '/s30coursedetails': '/s30_course_details',
  '/s31syllabus': '/s31_syllabus',
  '/s32instructorprofile': '/s32_instructor_profile',
  '/s33coursereviews': '/s33_course_reviews',
  '/s34comparecourses': '/s34_compare_courses',
  '/s35lessonpreview': '/s35_lesson_preview',
  '/s36videoplayer': '/s36_video_player',
  '/s37audiolesson': '/s37_audio_lesson',
  '/s38readinglesson': '/s38_reading_lesson',
  '/s39xemslide': '/s39_xem_slide',
  '/s40timestampedvideonotes': '/s40_timestamped_video_notes',
  '/s41dictionarylookup': '/s41_dictionary_lookup',
  '/s42manageofflinedownloads': '/s42_manage_offline_downloads',
  '/s43lessonplaylist': '/s43_lesson_playlist',
  '/s44focusmode': '/s44_focus_mode',
  '/s45choosecohortschedule': '/s45_choose_cohort_schedule',
  '/s46mycourses': '/s46_my_courses',
  '/s47courseprogressdetails': '/s47_course_progress_details',
  '/s48nextcourserecommendations': '/s48_next_course_recommendations',
  '/s79_forum': '/s79_community_forum',
  '/s79forum': '/s79_community_forum',
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
  '/s97_instructor_dashboard': '/s10_learner_home',
};

/// Central route lookup that also resolves legacy aliases. When no route
/// matches, falls back to a tiny debug menu so every flow stays runnable.
Map<String, WidgetBuilder> get _resolvedRoutes {
  final map = <String, WidgetBuilder>{...appRoutes};
  _routeAliases.forEach((alias, target) {
    if (appRoutes.containsKey(target) && !map.containsKey(alias)) {
      map[alias] = appRoutes[target]!;
    }
  });
  return map;
}

class DebugRouteMenu extends StatelessWidget {
  const DebugRouteMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = appRoutes.keys.toList()..sort();
    return Scaffold(
      appBar: AppBar(title: const Text('All Screens')),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          final route = routes[index];
          return ListTile(
            title: Text(route),
            trailing: const Icon(Icons.chevron_right),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(route),
          );
        },
      ),
    );
  }
}

const String initialRoute = String.fromEnvironment(
  'INITIAL_ROUTE',
  defaultValue: '/s01_splash',
);

Map<String, WidgetBuilder> get routes => _resolvedRoutes;
