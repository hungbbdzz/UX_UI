import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: S32 – Instructor profile
 * Figma Frame ID: 21:9873 | Nhóm: Part B · Member 2 — Course discovery and learning content (S25–S48)
 */
export const S32InstructorProfileScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part B · Member 2</Text>
          <Text style={styles.title}>S32 – Instructor profile</Text>
          <Text style={styles.subtext}>Figma ID: 21:9873 (390 x 1654 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (10):</Text>

        // Prototype: ON_CLICK -> Quay lại màn hình trước
        <TouchableOpacity
          style={styles.btnBack}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.buttonText}>Button - Go back → Quay lại màn hình trước</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S30 – Course details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S30CourseDetails')}
        >
          <Text style={styles.buttonText}>Text → S30 – Course details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S88 – Inbox
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S88 – Inbox (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Direct Message Button → S88 – Inbox</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S85 – Book a 1-on-1 mentor
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S85 – Book a 1-on-1 mentor (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Button - Book 1-on-1 Mentorship (High... → S85 – Book a 1-on-1 mentor</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S29 – Search results
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S29SearchResults')}
        >
          <Text style={styles.buttonText}>Text → S29 – Search results</Text>
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
