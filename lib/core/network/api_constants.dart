class ApiConstants {
  ApiConstants._();

  static const String baseUrl = "http://localhost:8765";

  static const String login = "/api/v1/auth/login";

  static const String register = "/api/v1/auth/register";

  static const String me = "/api/v1/auth/me";

  static const String profile = "/api/v1/users/profile";

  static const String profileMe = "/api/v1/users/profile/me";

  static const cycleProfile = "/api/v1/tracking/cycle/profile";

  static const cycles = "/api/v1/tracking/cycles";

  static const startCycle = "/api/v1/tracking/cycles/start";

  static const symptoms = "/api/v1/tracking/symptoms";

  static const emotionJournal = "/api/v1/tracking/emotion-journal";

  static const foodJournal = "/api/v1/tracking/food-journal";

  static const nutrition = "/api/v1/analytics/nutrition";

  static const nutritionSearch = "/api/v1/analytics/nutrition/search";

  static const nutritionAnalyze = "/api/v1/analytics/nutrition/analyze";

  static const predictions = "/api/v1/analytics/predictions";

  static const generatePrediction = "/api/v1/analytics/predictions/generate";

  static const latestPrediction = "/api/v1/analytics/predictions/latest";

  static const statistics = "/api/v1/analytics/statistics";

  static const generateStatistics = "/api/v1/analytics/statistics/generate";

  static const latestStatistics = "/api/v1/analytics/statistics/latest";

  static const healthInsights = "/api/v1/analytics/health-insights";

  static const generateHealthInsight = "/api/v1/analytics/health-insights/generate";

  static const latestHealthInsight = "/api/v1/analytics/health-insights/latest";

  static const notifications = "/api/v1/notifications";

  static const unreadNotifications = "/api/v1/notifications/unread";

  static const markAllNotificationsRead = "/api/v1/notifications/read-all";

  static const reports = "/api/v1/reports";

  static const generateReport = "/api/v1/reports/generate";
  
  static const communityPublications = "/api/v1/community/publications";

  static const myPublications = "/api/v1/community/publications/me";

  static const publications = "/api/v1/community/publications";

  static const comments = "/api/v1/community/comments";

  static const deleteAccount = "/api/v1/auth/me";

  static const education = "/api/v1/education";
}