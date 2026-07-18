import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'statistics_state.dart';
import '../repositories/statistics_repository.dart';

final statisticsProvider =
    NotifierProvider<StatisticsNotifier, StatisticsState>(
  StatisticsNotifier.new,
);

class StatisticsNotifier
    extends Notifier<StatisticsState> {

  final StatisticsRepository _repository =
      StatisticsRepository();

  @override
  StatisticsState build() {
    return const StatisticsState();
  }

  Future<void> generateStatistics() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.generateStatistics();

      final latest =
          await _repository.getLatestStatistics();

      state = state.copyWith(
        statistics: latest.data,
      );
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<void> loadLatestStatistics() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.getLatestStatistics();

      state = state.copyWith(
        statistics: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }
}