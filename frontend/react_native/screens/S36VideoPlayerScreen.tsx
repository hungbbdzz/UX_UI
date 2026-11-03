import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, SafeAreaView } from 'react-native';

/**
 * Màn hình: S36 – Video player
 * Figma Frame ID: 21:10957 | Nhóm: Part B · Member 2 — Course discovery and learning content (S25–S48)
 */
export const S36VideoPlayerScreen = ({ navigation }: any) => {
  return (
    <SafeAreaView style={styles.safeArea}>
      <ScrollView contentContainerStyle={styles.container}>
        <View style={styles.card}>
          <Text style={styles.badge}>Part B · Member 2</Text>
          <Text style={styles.title}>S36 – Video player</Text>
          <Text style={styles.subtext}>Figma ID: 21:10957 (390 x 1320 px)</Text>
        </View>

        <Text style={styles.sectionHeader}>Các liên kết tương tác Prototype (11):</Text>

        // Prototype: ON_CLICK -> Quay lại màn hình trước
        <TouchableOpacity
          style={styles.btnBack}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.buttonText}>Button - Go back:margin → Quay lại màn hình trước</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S41 – Dictionary lookup
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S41DictionaryLookup')}
        >
          <Text style={styles.buttonText}>Button - Look up definition for lambd... → S41 – Dictionary lookup</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S40 – Timestamped video notes
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S40TimestampedVideoNotes')}
        >
          <Text style={styles.buttonText}>1. Take Note Button → S40 – Timestamped video notes</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S43 – Lesson playlist
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S43LessonPlaylist')}
        >
          <Text style={styles.buttonText}>2. Playlist / Syllabus Drawer Button → S43 – Lesson playlist</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S42 – Manage offline downloads
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S42ManageOfflineDownloads')}
        >
          <Text style={styles.buttonText}>3. Offline Download Button → S42 – Manage offline downloads</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S40 – Timestamped video notes
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S40TimestampedVideoNotes')}
        >
          <Text style={styles.buttonText}>Button → S40 – Timestamped video notes</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S80 – Discussion thread
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S80 – Discussion thread (Part D · Member 4 — Live classes, community and payments (S73–S96))')}
        >
          <Text style={styles.buttonText}>Button → S80 – Discussion thread</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S40 – Timestamped video notes
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S40TimestampedVideoNotes')}
        >
          <Text style={styles.buttonText}>Tab Dynamic Content Slot → Notes Cont... → S40 – Timestamped video notes</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S49 – Multiple-choice quiz
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S49 – Multiple-choice quiz (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Link - Tactile Up Next Card → S49 – Multiple-choice quiz</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S43 – Lesson playlist
        <TouchableOpacity
          style={styles.btnNav}
          onPress={() => navigation.navigate('S43LessonPlaylist')}
        >
          <Text style={styles.buttonText}>Next lesson in the syllabus → S43 – Lesson playlist</Text>
        </TouchableOpacity>
        // Prototype: ON_CLICK -> S49 – Multiple-choice quiz
        <TouchableOpacity
          style={styles.btnCross}
          onPress={() => alert('Chuyển tiếp: S49 – Multiple-choice quiz (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')}
        >
          <Text style={styles.buttonText}>Link → S49 – Multiple-choice quiz</Text>
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
