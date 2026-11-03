import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: S09 – Suggested learning path
 * Figma Frame ID: 11:953 | Nhóm: Part A · Member 1 — Onboarding, personalization and progress (S01–S24)
 */
export const S09SuggestedLearningPathScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part A · Member 1</Text>
          <Text style={styles.title}>S09 – Suggested learning path</Text>
          <Text style={styles.subtext}>Figma ID: 11:953 (390 x 1003 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (5):</Text>

        // Prototype: ON_CLICK -> S30 – Course details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S30CourseDetails')}
        >
          <Text style={styles.buttonText}>Python Foundations & Syntax → S30 – Course details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S30 – Course details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S30CourseDetails')}
        >
          <Text style={styles.buttonText}>Data Structures & Functions → S30 – Course details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S30 – Course details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S30CourseDetails')}
        >
          <Text style={styles.buttonText}>Object-Oriented Programming (OOP) → S30 – Course details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S30 – Course details
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S30CourseDetails')}
        >
          <Text style={styles.buttonText}>Applied Mini-Projects & Capstone → S30 – Course details</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S10 – Learner home
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S10LearnerHome')}
        >
          <Text style={styles.buttonText}>Button → S10 – Learner home</Text>
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
