import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'health_insight_state.dart';
import '../repositories/health_insight_repository.dart';

final healthInsightProvider =
    NotifierProvider<
        HealthInsightNotifier,
        HealthInsightState>(
  HealthInsightNotifier.new,
);

class HealthInsightNotifier
    extends Notifier<HealthInsightState> {
  final HealthInsightRepository _repository =
      HealthInsightRepository();

  @override
  HealthInsightState build() {
    return const HealthInsightState();
  }

  Future<void> generateHealthInsight() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.generateHealthInsight();

      final latest =
          await _repository.getLatestHealthInsight();

      state = state.copyWith(
        insight: latest.data,
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

  Future<void> loadLatestHealthInsight() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.getLatestHealthInsight();

      state = state.copyWith(
        insight: response.data,
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