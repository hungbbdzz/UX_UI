/**
 * EduPath Backend API Service for React Native
 * Đồ án môn Thiết kế UX/UI - GV ThS. Lý Quỳnh Trân
 */

const BASE_URL = 'http://127.0.0.1:8000/api/v1';

let authToken: string | null = null;

export const setAuthToken = (token: string) => {
  authToken = token;
};

const getHeaders = () => {
  const headers: Record<string, string> = {
    'Content-Type': 'application/json',
  };
  if (authToken) {
    headers['Authorization'] = `Bearer ${authToken}`;
  }
  return headers;
};

export const EduPathApi = {
  // 1. Auth (A01, A02)
  login: async (email: string, password: string) => {
    const res = await fetch(`${BASE_URL}/auth/login`, {
      method: 'POST',
      headers: getHeaders(),
      body: JSON.stringify({ email, password }),
    });
    const data = await res.json();
    if (res.ok) {
      authToken = data.access_token;
      return data;
    }
    throw new Error(data.detail || 'Đăng nhập thất bại');
  },

  // 2. Learner Home (S10)
  getLearnerHome: async () => {
    const res = await fetch(`${BASE_URL}/learner/home`, {
      method: 'GET',
      headers: getHeaders(),
    });
    return res.json();
  },

  // 3. Courses Explore (S25)
  getExploreCourses: async () => {
    const res = await fetch(`${BASE_URL}/courses/explore`, {
      method: 'GET',
      headers: getHeaders(),
    });
    return res.json();
  },

  // 4. Course Details (S30)
  getCourseDetail: async (courseId: number) => {
    const res = await fetch(`${BASE_URL}/courses/${courseId}`, {
      method: 'GET',
      headers: getHeaders(),
    });
    return res.json();
  },

  // 5. Lesson Content (S36-S39)
  getLessonContent: async (lessonId: number) => {
    const res = await fetch(`${BASE_URL}/learning/lessons/${lessonId}`, {
      method: 'GET',
      headers: getHeaders(),
    });
    return res.json();
  },

  // 6. My Enrolled Courses (S46)
  getEnrolledCourses: async () => {
    const res = await fetch(`${BASE_URL}/my-courses/enrolled`, {
      method: 'GET',
      headers: getHeaders(),
    });
    return res.json();
  },
};
