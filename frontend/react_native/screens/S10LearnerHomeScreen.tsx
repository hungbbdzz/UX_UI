import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: S10 – Learner home
 * Figma Frame ID: 11:1551 | Nhóm: Part A · Member 1 — Onboarding, personalization and progress (S01–S24)
 */
export const S10LearnerHomeScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part A · Member 1</Text>
          <Text style={styles.title}>S10 – Learner home</Text>
          <Text style={styles.subtext}>Figma ID: 11:1551 (390 x 1398 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (29):</Text>

        // Prototype: ON_CLICK -> S87 – Notifications
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S87 – Notifications (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Button - Notifications → S87 – Notifications</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S18 – Personal profile
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S18PersonalProfile')}
        >
          <Text style={styles.buttonText}>Background → S18 – Personal profile</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S12 – Study streak
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S12StudyStreak')}
        >
          <Text style={styles.buttonText}>Link - Streak details → S12 – Study streak</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S16 – Level and XP
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S16LevelAndXp')}
        >
          <Text style={styles.buttonText}>Link - XP details → S16 – Level and XP</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S88 – Inbox
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S88 – Inbox (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Link - Messages → S88 – Inbox</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S87 – Notifications
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S87 – Notifications (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Link - Notifications → S87 – Notifications</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S27 – Search
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S27Search')}
        >
          <Text style={styles.buttonText}>Link - Search Bar (S27) → S27 – Search</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S30 – Course details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S30CourseDetails')}
        >
          <Text style={styles.buttonText}>Link → S30 – Course details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S36 – Video player
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S36VideoPlayer')}
        >
          <Text style={styles.buttonText}>Link - Primary Action CTA Button → S36 – Video player</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S11 – Today's study plan
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S11TodaySStudyPlan')}
        >
          <Text style={styles.buttonText}>Link → View all (5 tasks) → → S11 – Today's study plan</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S49 – Multiple-choice quiz
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S49 – Multiple-choice quiz (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Text → S49 – Multiple-choice quiz</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S77 – Study schedule
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S77 – Study schedule (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Link - Study schedule → S77 – Study schedule</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S11 – Today's study plan
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S11TodaySStudyPlan')}
        >
          <Text style={styles.buttonText}>Study schedule → → S11 – Today's study plan</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S13 – Weekly goals
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S13WeeklyGoals')}
        >
          <Text style={styles.buttonText}>Link - Weekly goals → S13 – Weekly goals</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S11 – Today's study plan
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S11TodaySStudyPlan')}
        >
          <Text style={styles.buttonText}>Weekly goals → → S11 – Today's study plan</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S17 – Daily quests
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S17DailyQuests')}
        >
          <Text style={styles.buttonText}>Link → S17 – Daily quests</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S26 – Course categories
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S26CourseCategories')}
        >
          <Text style={styles.buttonText}>Link → S26 – Course categories</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S26 – Course categories
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S26CourseCategories')}
        >
          <Text style={styles.buttonText}>Link - Pill: Python (Selected) → S26 – Course categories</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S26 – Course categories
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S26CourseCategories')}
        >
          <Text style={styles.buttonText}>Link - Pill: English A2 → S26 – Course categories</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S26 – Course categories
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S26CourseCategories')}
        >
          <Text style={styles.buttonText}>Link - Pill: UI/UX → S26 – Course categories</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S26 – Course categories
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S26CourseCategories')}
        >
          <Text style={styles.buttonText}>Link - Pill: Data Science → S26 – Course categories</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S26 – Course categories
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S26CourseCategories')}
        >
          <Text style={styles.buttonText}>Link - Pill: Logic → S26 – Course categories</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S48 – Next course recommendations
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S48NextCourseRecommendations')}
        >
          <Text style={styles.buttonText}>Link → S48 – Next course recommendations</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S30 – Course details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S30CourseDetails')}
        >
          <Text style={styles.buttonText}>Link - Recommended Course 1 → S30 – Course details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S30 – Course details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S30CourseDetails')}
        >
          <Text style={styles.buttonText}>Link - Recommended Course 2 → S30 – Course details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S25 – Explore
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S25Explore')}
        >
          <Text style={styles.buttonText}>GO:S25 / Explore → S25 – Explore</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S46 – My courses
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S46MyCourses')}
        >
          <Text style={styles.buttonText}>GO:S46 / Courses → S46 – My courses</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S79 – Forum
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S79 – Forum (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>GO:S79 / Community → S79 – Forum</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S18 – Personal profile
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S18PersonalProfile')}
        >
          <Text style={styles.buttonText}>GO:S18 / Profile → S18 – Personal profile</Text>
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  safeArea: { flex: 1, backgroundColor: '#F9F9FF' },
  container: { padding: 16 },
  card: { backgroundColor: '#FFFFFF', padding: 18, borderRadius: 16, marginBottom: 20, borderWidth: 1, borderColor: '#E2E8F8', shadowColor: '#000', shadowOpacity: 0.04, shadowRadius: 8, elevation: 2 },
  badge: { fontSize: 11, fontWeight: '700', color: '#2A14B4', marginBottom: 6, textTransform: 'uppercase' },
  title: { fontSize: 20, fontWeight: '700', color: '#151C27', marginBottom: 4 },
  subtext: { fontSize: 12, color: '#777586' },
  sectionHeader: { fontSize: 14, fontWeight: '700', color: '#2A14B4', marginBottom: 12 },
  btnNav: { backgroundColor: '#FD761A', paddingVertical: 14, paddingHorizontal: 16, borderRadius: 12, marginBottom: 10 },
  btnBack: { backgroundColor: '#464554', paddingVertical: 14, paddingHorizontal: 16, borderRadius: 12, marginBottom: 10 },
  btnCross: { backgroundColor: '#2A14B4', paddingVertical: 14, paddingHorizontal: 16, borderRadius: 12, marginBottom: 10 },
  buttonText: { color: '#FFFFFF', fontWeight: '600', fontSize: 13 }
});
