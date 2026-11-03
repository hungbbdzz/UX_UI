import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: S46 – My courses
 * Figma Frame ID: 34:549 | Nhóm: Part B · Member 2 — Course discovery and learning content (S25–S48)
 */
export const S46MyCoursesScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part B · Member 2</Text>
          <Text style={styles.title}>S46 – My courses</Text>
          <Text style={styles.subtext}>Figma ID: 34:549 (390 x 1255 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (10):</Text>

        // Prototype: ON_CLICK -> S47 – Course progress details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S47CourseProgressDetails')}
        >
          <Text style={styles.buttonText}>Practical Python for Data Analysis & ... → S47 – Course progress details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S36 – Video player
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S36VideoPlayer')}
        >
          <Text style={styles.buttonText}>Button → S36 – Video player</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S47 – Course progress details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S47CourseProgressDetails')}
        >
          <Text style={styles.buttonText}>English for Tech Careers: Interviews ... → S47 – Course progress details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S37 – Audio lesson
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S37AudioLesson')}
        >
          <Text style={styles.buttonText}>Button → S37 – Audio lesson</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S47 – Course progress details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S47CourseProgressDetails')}
        >
          <Text style={styles.buttonText}>Data Engineering Essentials: Stream M... → S47 – Course progress details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S38 – Reading lesson
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S38ReadingLesson')}
        >
          <Text style={styles.buttonText}>Button → S38 – Reading lesson</Text>
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
