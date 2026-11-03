import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: A02 – Learner registration
 * Figma Frame ID: 107:31 | Nhóm: Part A · Member 1 — Onboarding, personalization and progress (S01–S24)
 */
export const A02LearnerRegistrationScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part A · Member 1</Text>
          <Text style={styles.title}>A02 – Learner registration</Text>
          <Text style={styles.subtext}>Figma ID: 107:31 (390 x 844 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (3):</Text>

        // Prototype: ON_CLICK -> A01 – Shared sign-in
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('A01SharedSignIn')}
        >
          <Text style={styles.buttonText}>GO:A01 / ‹ → A01 – Shared sign-in</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S03 – Select learning goal
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S03SelectLearningGoal')}
        >
          <Text style={styles.buttonText}>GO:AUTH:register / Create learner acc... → S03 – Select learning goal</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> A01 – Shared sign-in
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('A01SharedSignIn')}
        >
          <Text style={styles.buttonText}>GO:A01 / Already have an account? Sig... → A01 – Shared sign-in</Text>
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
