import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: S16 – Level and XP
 * Figma Frame ID: 11:2322 | Nhóm: Part A · Member 1 — Onboarding, personalization and progress (S01–S24)
 */
export const S16LevelAndXpScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part A · Member 1</Text>
          <Text style={styles.title}>S16 – Level and XP</Text>
          <Text style={styles.subtext}>Figma ID: 11:2322 (390 x 1442 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (12):</Text>

        // Prototype: ON_CLICK -> S36 – Video player
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S36VideoPlayer')}
        >
          <Text style={styles.buttonText}>Complete a Lesson → S36 – Video player</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S49 – Multiple-choice quiz
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S49 – Multiple-choice quiz (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Pass a Quiz → S49 – Multiple-choice quiz</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S17 – Daily quests
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S17DailyQuests')}
        >
          <Text style={styles.buttonText}>Daily Quest → S17 – Daily quests</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S58 – Flashcard
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S58 – Flashcard (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Review Decks → S58 – Flashcard</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S15 – Badges
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S15Badges')}
        >
          <Text style={styles.buttonText}>Milestone Rewards → S15 – Badges</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S70 – Leaderboard
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S70 – Leaderboard (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Primary Sticky Bottom Action Bar → Bu... → S70 – Leaderboard</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> Quay lại màn hình trước
        <TouchableOpacity
          style={styles.btnBack}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.buttonText}>Button - Quay lại:margin → Quay lại màn hình trước</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S10 – Learner home
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S10LearnerHome')}
        >
          <Text style={styles.buttonText}>GO:S10 / Home → S10 – Learner home</Text>
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
