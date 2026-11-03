import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: S31 – Syllabus
 * Figma Frame ID: 21:9390 | Nhóm: Part B · Member 2 — Course discovery and learning content (S25–S48)
 */
export const S31SyllabusScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part B · Member 2</Text>
          <Text style={styles.title}>S31 – Syllabus</Text>
          <Text style={styles.subtext}>Figma ID: 21:9390 (390 x 1612 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (17):</Text>

        // Prototype: ON_CLICK -> S36 – Video player
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S36VideoPlayer')}
        >
          <Text style={styles.buttonText}>Link - Lesson 1.1 → S36 – Video player</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S37 – Audio lesson
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S37AudioLesson')}
        >
          <Text style={styles.buttonText}>Link - Lesson 1.2 → S37 – Audio lesson</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S38 – Reading lesson
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S38ReadingLesson')}
        >
          <Text style={styles.buttonText}>Link - Lesson 1.3 → S38 – Reading lesson</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S39 – Xem slide
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S39XemSlide')}
        >
          <Text style={styles.buttonText}>Link - Lesson 1.4 → S39 – Xem slide</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S49 – Multiple-choice quiz
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S49 – Multiple-choice quiz (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Link - Lesson 1.5 → S49 – Multiple-choice quiz</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S36 – Video player
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S36VideoPlayer')}
        >
          <Text style={styles.buttonText}>Link - Lesson 2.1 → S36 – Video player</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S37 – Audio lesson
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S37AudioLesson')}
        >
          <Text style={styles.buttonText}>Lesson 2.2 → S37 – Audio lesson</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S38 – Reading lesson
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S38ReadingLesson')}
        >
          <Text style={styles.buttonText}>Lesson 2.3 → S38 – Reading lesson</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S65 – Submit assignment
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S65 – Submit assignment (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Lesson 2.4 → S65 – Submit assignment</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S49 – Multiple-choice quiz
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S49 – Multiple-choice quiz (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Lesson 2.5 → S49 – Multiple-choice quiz</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S30 – Course details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S30CourseDetails')}
        >
          <Text style={styles.buttonText}>Link → S30 – Course details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> Quay lại màn hình trước
        <TouchableOpacity
          style={styles.btnBack}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.buttonText}>Button - Go back → Quay lại màn hình trước</Text>
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
