import '../models/health_insight.dart';

class HealthInsightState {
  final bool isLoading;

  final HealthInsight? insight;

  final String? error;

  const HealthInsightState({
    this.isLoading = false,
    this.insight,
    this.error,
  });

  HealthInsightState copyWith({
    bool? isLoading,
    HealthInsight? insight,
    String? error,
  }) {
    return HealthInsightState(
      isLoading: isLoading ?? this.isLoading,
      insight: insight ?? this.insight,
      error: error,
    );
  }
}