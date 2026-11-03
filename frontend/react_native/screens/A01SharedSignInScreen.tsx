import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: A01 – Shared sign-in
 * Figma Frame ID: 107:3 | Nhóm: Part A · Member 1 — Onboarding, personalization and progress (S01–S24)
 */
export const A01SharedSignInScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part A · Member 1</Text>
          <Text style={styles.title}>A01 – Shared sign-in</Text>
          <Text style={styles.subtext}>Figma ID: 107:3 (390 x 844 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (4):</Text>

        // Prototype: ON_CLICK -> S02 – Feature introduction
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S02FeatureIntroduction')}
        >
          <Text style={styles.buttonText}>GO:S02 / ‹ → S02 – Feature introduction</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S10 – Learner home
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S10LearnerHome')}
        >
          <Text style={styles.buttonText}>GO:AUTH:login / Sign in → S10 – Learner home</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> A02 – Learner registration
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('A02LearnerRegistration')}
        >
          <Text style={styles.buttonText}>GO:A02 / Create learner account → A02 – Learner registration</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> A03 – Instructor registration
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: A03 – Instructor registration (Part E · Member 5 — Instructor and administration (S97–S120))')}
        >
          <Text style={styles.buttonText}>GO:A03 / Instructor registration → A03 – Instructor registration</Text>
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
