import 'dart:convert';
import 'package:http/http.dart' as http;

/// Dịch vụ kết nối API Backend EduPath (FastAPI)
/// Phục vụ đồ án môn Thiết kế UX/UI - GV ThS. Lý Quỳnh Trân
class EduPathApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/v1';

  static String? _jwtToken;

  static void setAuthToken(String token) {
    _jwtToken = token;
  }

  static Map<String, String> _getHeaders() {
    final headers = {'Content-Type': 'application/json'};
    if (_jwtToken != null) {
      headers['Authorization'] = 'Bearer $_jwtToken';
    }
    return headers;
  }

  // 1. Auth (A01, A02)
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: _getHeaders(),
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      _jwtToken = data['access_token'];
      return data;
    }
    throw Exception('Đăng nhập thất bại: ${response.body}');
  }

  // 2. Learner Home (S10)
  static Future<Map<String, dynamic>> getLearnerHome() async {
    final response = await http.get(
      Uri.parse('$baseUrl/learner/home'),
      headers: _getHeaders(),
    );
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Exception('Lỗi tải dữ liệu trang chủ: ${response.body}');
  }

  // 3. Courses Explore (S25)
  static Future<Map<String, dynamic>> getExploreCourses() async {
    final response = await http.get(
      Uri.parse('$baseUrl/courses/explore'),
      headers: _getHeaders(),
    );
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Exception('Lỗi tải danh sách khám phá: ${response.body}');
  }

  // 4. Course Details (S30)
  static Future<Map<String, dynamic>> getCourseDetail(int courseId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/courses/$courseId'),
      headers: _getHeaders(),
    );
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Exception('Lỗi tải chi tiết khóa học: ${response.body}');
  }

  // 5. Lesson Content (S36-S39)
  static Future<Map<String, dynamic>> getLessonContent(int lessonId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/learning/lessons/$lessonId'),
      headers: _getHeaders(),
    );
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Exception('Lỗi tải bài học: ${response.body}');
  }

  // 6. My Enrolled Courses (S46)
  static Future<List<dynamic>> getEnrolledCourses() async {
    final response = await http.get(
      Uri.parse('$baseUrl/my-courses/enrolled'),
      headers: _getHeaders(),
    );
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Exception('Lỗi tải khóa học đã đăng ký: ${response.body}');
  }
}
