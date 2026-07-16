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
}