import React from 'react';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { S01SplashScreen } from './screens/S01SplashScreen';
import { S03SelectLearningGoalScreen } from './screens/S03SelectLearningGoalScreen';
import { S04SelectInterestsScreen } from './screens/S04SelectInterestsScreen';
import { S02FeatureIntroductionScreen } from './screens/S02FeatureIntroductionScreen';
import { S06SetDailyStudyTimeScreen } from './screens/S06SetDailyStudyTimeScreen';
import { S08PlacementResultsScreen } from './screens/S08PlacementResultsScreen';
import { S05SelectCurrentLevelScreen } from './screens/S05SelectCurrentLevelScreen';
import { S07PlacementTestAssessmentScreen } from './screens/S07PlacementTestAssessmentScreen';
import { S09SuggestedLearningPathScreen } from './screens/S09SuggestedLearningPathScreen';
import { S11TodaySStudyPlanScreen } from './screens/S11TodaySStudyPlanScreen';
import { S12StudyStreakScreen } from './screens/S12StudyStreakScreen';
import { S10LearnerHomeScreen } from './screens/S10LearnerHomeScreen';
import { S14LearningStatisticsScreen } from './screens/S14LearningStatisticsScreen';
import { S15BadgesScreen } from './screens/S15BadgesScreen';
import { S16LevelAndXpScreen } from './screens/S16LevelAndXpScreen';
import { S13WeeklyGoalsScreen } from './screens/S13WeeklyGoalsScreen';
import { S21AchievementSharingCardScreen } from './screens/S21AchievementSharingCardScreen';
import { S22LearningSettingsScreen } from './screens/S22LearningSettingsScreen';
import { S24DisplayAndAccessibilityScreen } from './screens/S24DisplayAndAccessibilityScreen';
import { S19EditProfileScreen } from './screens/S19EditProfileScreen';
import { S18PersonalProfileScreen } from './screens/S18PersonalProfileScreen';
import { S17DailyQuestsScreen } from './screens/S17DailyQuestsScreen';
import { S20SkillTreeScreen } from './screens/S20SkillTreeScreen';
import { S23StudyRemindersScreen } from './screens/S23StudyRemindersScreen';
import { A01SharedSignInScreen } from './screens/A01SharedSignInScreen';
import { A02LearnerRegistrationScreen } from './screens/A02LearnerRegistrationScreen';
import { S25ExploreScreen } from './screens/S25ExploreScreen';
import { S26CourseCategoriesScreen } from './screens/S26CourseCategoriesScreen';
import { S27SearchScreen } from './screens/S27SearchScreen';
import { S28AdvancedFiltersScreen } from './screens/S28AdvancedFiltersScreen';
import { S29SearchResultsScreen } from './screens/S29SearchResultsScreen';
import { S31SyllabusScreen } from './screens/S31SyllabusScreen';
import { S30CourseDetailsScreen } from './screens/S30CourseDetailsScreen';
import { S32InstructorProfileScreen } from './screens/S32InstructorProfileScreen';
import { S34CompareCoursesScreen } from './screens/S34CompareCoursesScreen';
import { S35LessonPreviewScreen } from './screens/S35LessonPreviewScreen';
import { S33CourseReviewsScreen } from './screens/S33CourseReviewsScreen';
import { S36VideoPlayerScreen } from './screens/S36VideoPlayerScreen';
import { S37AudioLessonScreen } from './screens/S37AudioLessonScreen';
import { S38ReadingLessonScreen } from './screens/S38ReadingLessonScreen';
import { S39XemSlideScreen } from './screens/S39XemSlideScreen';
import { S40TimestampedVideoNotesScreen } from './screens/S40TimestampedVideoNotesScreen';
import { S42ManageOfflineDownloadsScreen } from './screens/S42ManageOfflineDownloadsScreen';
import { S44FocusModeScreen } from './screens/S44FocusModeScreen';
import { S41DictionaryLookupScreen } from './screens/S41DictionaryLookupScreen';
import { S43LessonPlaylistScreen } from './screens/S43LessonPlaylistScreen';
import { S48NextCourseRecommendationsScreen } from './screens/S48NextCourseRecommendationsScreen';
import { S47CourseProgressDetailsScreen } from './screens/S47CourseProgressDetailsScreen';
import { S46MyCoursesScreen } from './screens/S46MyCoursesScreen';
import { S45ChooseCohortScheduleScreen } from './screens/S45ChooseCohortScheduleScreen';

const Stack = createNativeStackNavigator();

export const AppNavigator = () => {
  return (
    <Stack.Navigator initialRouteName="S01Splash">
        <Stack.Screen name="S01Splash" component={S01SplashScreen} options={{ title: 'S01 – Splash' }} />
        <Stack.Screen name="S03SelectLearningGoal" component={S03SelectLearningGoalScreen} options={{ title: 'S03 – Select learning goal' }} />
        <Stack.Screen name="S04SelectInterests" component={S04SelectInterestsScreen} options={{ title: 'S04 – Select interests' }} />
        <Stack.Screen name="S02FeatureIntroduction" component={S02FeatureIntroductionScreen} options={{ title: 'S02 – Feature introduction' }} />
        <Stack.Screen name="S06SetDailyStudyTime" component={S06SetDailyStudyTimeScreen} options={{ title: 'S06 – Set daily study time' }} />
        <Stack.Screen name="S08PlacementResults" component={S08PlacementResultsScreen} options={{ title: 'S08 – Placement results' }} />
        <Stack.Screen name="S05SelectCurrentLevel" component={S05SelectCurrentLevelScreen} options={{ title: 'S05 – Select current level' }} />
        <Stack.Screen name="S07PlacementTestAssessment" component={S07PlacementTestAssessmentScreen} options={{ title: 'S07 – Placement Test Assessment' }} />
        <Stack.Screen name="S09SuggestedLearningPath" component={S09SuggestedLearningPathScreen} options={{ title: 'S09 – Suggested learning path' }} />
        <Stack.Screen name="S11TodaySStudyPlan" component={S11TodaySStudyPlanScreen} options={{ title: 'S11 – Today\'s study plan' }} />
        <Stack.Screen name="S12StudyStreak" component={S12StudyStreakScreen} options={{ title: 'S12 – Study streak' }} />
        <Stack.Screen name="S10LearnerHome" component={S10LearnerHomeScreen} options={{ title: 'S10 – Learner home' }} />
        <Stack.Screen name="S14LearningStatistics" component={S14LearningStatisticsScreen} options={{ title: 'S14 – Learning statistics' }} />
        <Stack.Screen name="S15Badges" component={S15BadgesScreen} options={{ title: 'S15 – Badges' }} />
        <Stack.Screen name="S16LevelAndXp" component={S16LevelAndXpScreen} options={{ title: 'S16 – Level and XP' }} />
        <Stack.Screen name="S13WeeklyGoals" component={S13WeeklyGoalsScreen} options={{ title: 'S13 – Weekly goals' }} />
        <Stack.Screen name="S21AchievementSharingCard" component={S21AchievementSharingCardScreen} options={{ title: 'S21 – Achievement sharing card' }} />
        <Stack.Screen name="S22LearningSettings" component={S22LearningSettingsScreen} options={{ title: 'S22 – Learning settings' }} />
        <Stack.Screen name="S24DisplayAndAccessibility" component={S24DisplayAndAccessibilityScreen} options={{ title: 'S24 – Display and accessibility' }} />
        <Stack.Screen name="S19EditProfile" component={S19EditProfileScreen} options={{ title: 'S19 – Edit profile' }} />
        <Stack.Screen name="S18PersonalProfile" component={S18PersonalProfileScreen} options={{ title: 'S18 – Personal profile' }} />
        <Stack.Screen name="S17DailyQuests" component={S17DailyQuestsScreen} options={{ title: 'S17 – Daily quests' }} />
        <Stack.Screen name="S20SkillTree" component={S20SkillTreeScreen} options={{ title: 'S20 – Skill tree' }} />
        <Stack.Screen name="S23StudyReminders" component={S23StudyRemindersScreen} options={{ title: 'S23 – Study reminders' }} />
        <Stack.Screen name="A01SharedSignIn" component={A01SharedSignInScreen} options={{ title: 'A01 – Shared sign-in' }} />
        <Stack.Screen name="A02LearnerRegistration" component={A02LearnerRegistrationScreen} options={{ title: 'A02 – Learner registration' }} />
        <Stack.Screen name="S25Explore" component={S25ExploreScreen} options={{ title: 'S25 – Explore' }} />
        <Stack.Screen name="S26CourseCategories" component={S26CourseCategoriesScreen} options={{ title: 'S26 – Course categories' }} />
        <Stack.Screen name="S27Search" component={S27SearchScreen} options={{ title: 'S27 – Search' }} />
        <Stack.Screen name="S28AdvancedFilters" component={S28AdvancedFiltersScreen} options={{ title: 'S28 – Advanced filters' }} />
        <Stack.Screen name="S29SearchResults" component={S29SearchResultsScreen} options={{ title: 'S29 – Search results' }} />
        <Stack.Screen name="S31Syllabus" component={S31SyllabusScreen} options={{ title: 'S31 – Syllabus' }} />
        <Stack.Screen name="S30CourseDetails" component={S30CourseDetailsScreen} options={{ title: 'S30 – Course details' }} />
        <Stack.Screen name="S32InstructorProfile" component={S32InstructorProfileScreen} options={{ title: 'S32 – Instructor profile' }} />
        <Stack.Screen name="S34CompareCourses" component={S34CompareCoursesScreen} options={{ title: 'S34 – Compare courses' }} />
        <Stack.Screen name="S35LessonPreview" component={S35LessonPreviewScreen} options={{ title: 'S35 – Lesson preview' }} />
        <Stack.Screen name="S33CourseReviews" component={S33CourseReviewsScreen} options={{ title: 'S33 – Course reviews' }} />
        <Stack.Screen name="S36VideoPlayer" component={S36VideoPlayerScreen} options={{ title: 'S36 – Video player' }} />
        <Stack.Screen name="S37AudioLesson" component={S37AudioLessonScreen} options={{ title: 'S37 – Audio lesson' }} />
        <Stack.Screen name="S38ReadingLesson" component={S38ReadingLessonScreen} options={{ title: 'S38 – Reading lesson' }} />
        <Stack.Screen name="S39XemSlide" component={S39XemSlideScreen} options={{ title: 'S39 – Xem slide' }} />
        <Stack.Screen name="S40TimestampedVideoNotes" component={S40TimestampedVideoNotesScreen} options={{ title: 'S40 – Timestamped video notes' }} />
        <Stack.Screen name="S42ManageOfflineDownloads" component={S42ManageOfflineDownloadsScreen} options={{ title: 'S42 – Manage offline downloads' }} />
        <Stack.Screen name="S44FocusMode" component={S44FocusModeScreen} options={{ title: 'S44 – Focus mode' }} />
        <Stack.Screen name="S41DictionaryLookup" component={S41DictionaryLookupScreen} options={{ title: 'S41 – Dictionary lookup' }} />
        <Stack.Screen name="S43LessonPlaylist" component={S43LessonPlaylistScreen} options={{ title: 'S43 – Lesson playlist' }} />
        <Stack.Screen name="S48NextCourseRecommendations" component={S48NextCourseRecommendationsScreen} options={{ title: 'S48 – Next course recommendations' }} />
        <Stack.Screen name="S47CourseProgressDetails" component={S47CourseProgressDetailsScreen} options={{ title: 'S47 – Course progress details' }} />
        <Stack.Screen name="S46MyCourses" component={S46MyCoursesScreen} options={{ title: 'S46 – My courses' }} />
        <Stack.Screen name="S45ChooseCohortSchedule" component={S45ChooseCohortScheduleScreen} options={{ title: 'S45 – Choose cohort schedule' }} />
    </Stack.Navigator>
  );
};
