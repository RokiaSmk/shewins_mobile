import '../models/statistics.dart';

class StatisticsState {
  final bool isLoading;

  final Statistics? statistics;

  final String? error;

  const StatisticsState({
    this.isLoading = false,
    this.statistics,
    this.error,
  });

  StatisticsState copyWith({
    bool? isLoading,
    Statistics? statistics,
    String? error,
  }) {
    return StatisticsState(
      isLoading: isLoading ?? this.isLoading,
      statistics: statistics ?? this.statistics,
      error: error,
    );
  }
}