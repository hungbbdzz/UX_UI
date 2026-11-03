import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: S18 – Personal profile
 * Figma Frame ID: 11:3798 | Nhóm: Part A · Member 1 — Onboarding, personalization and progress (S01–S24)
 */
export const S18PersonalProfileScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part A · Member 1</Text>
          <Text style={styles.title}>S18 – Personal profile</Text>
          <Text style={styles.subtext}>Figma ID: 11:3798 (390 x 1740 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (20):</Text>

        // Prototype: ON_CLICK -> S69 – Certificates
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S69 – Certificates (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Certificates → S69 – Certificates</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S15 – Badges
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S15Badges')}
        >
          <Text style={styles.buttonText}>Badges → S15 – Badges</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S97 – Instructor dashboard
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S97 – Instructor dashboard (Part E · Member 5 — Instructor and administration (S97–S120))')}
        >
          <Text style={styles.buttonText}>Link → S97 – Instructor dashboard</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S19 – Edit profile
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S19EditProfile')}
        >
          <Text style={styles.buttonText}>Link - 1. Edit Profile → S19 – Edit profile</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S20 – Skill tree
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S20SkillTree')}
        >
          <Text style={styles.buttonText}>Link - 2. Skill Tree → S20 – Skill tree</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S13 – Weekly goals
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S13WeeklyGoals')}
        >
          <Text style={styles.buttonText}>Link - 3. Weekly Goals → S13 – Weekly goals</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S22 – Learning settings
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S22LearningSettings')}
        >
          <Text style={styles.buttonText}>Link - 4. Study Settings → S22 – Learning settings</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S95 – Invite friends
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S95 – Invite friends (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Link - 5. Refer a Friend → S95 – Invite friends</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S96 – Help center
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S96 – Help center (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Link - 6. Help & Support → S96 – Help center</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S14 – Learning statistics
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S14LearningStatistics')}
        >
          <Text style={styles.buttonText}>Link - Learning Statistics → S14 – Learning statistics</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S68 – Gradebook
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S68 – Gradebook (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Link - Gradebook → S68 – Gradebook</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S66 – Assignment queue
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S66 – Assignment queue (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Link - Assignments → S66 – Assignment queue</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S93 – Transaction history
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S93 – Transaction history (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Link - Transactions → S93 – Transaction history</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S19 – Edit profile
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S19EditProfile')}
        >
          <Text style={styles.buttonText}>Link - Primary Edit Button → S19 – Edit profile</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> A01 – Shared sign-in
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('A01SharedSignIn')}
        >
          <Text style={styles.buttonText}>Button - Log Out Secondary Danger Action → A01 – Shared sign-in</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> Quay lại màn hình trước
        <TouchableOpacity
          style={styles.btnBack}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.buttonText}>Background+Shadow → Quay lại màn hình trước</Text>
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
