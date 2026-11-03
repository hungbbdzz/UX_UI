import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: S37 – Audio lesson
 * Figma Frame ID: 21:11200 | Nhóm: Part B · Member 2 — Course discovery and learning content (S25–S48)
 */
export const S37AudioLessonScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part B · Member 2</Text>
          <Text style={styles.title}>S37 – Audio lesson</Text>
          <Text style={styles.subtext}>Figma ID: 21:11200 (390 x 1300 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (4):</Text>

        // Prototype: ON_CLICK -> Quay lại màn hình trước
        <TouchableOpacity
          style={styles.btnBack}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.buttonText}>Button - Go back:margin → Quay lại màn hình trước</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S31 – Syllabus
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S31Syllabus')}
        >
          <Text style={styles.buttonText}>Text → S31 – Syllabus</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S36 – Video player
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S36VideoPlayer')}
        >
          <Text style={styles.buttonText}>Button → S36 – Video player</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S41 – Dictionary lookup
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S41DictionaryLookup')}
        >
          <Text style={styles.buttonText}>Button → S41 – Dictionary lookup</Text>
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
