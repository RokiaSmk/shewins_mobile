import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/prediction_state.dart';
import '../repositories/prediction_repository.dart';

final predictionProvider =
    NotifierProvider<PredictionNotifier, PredictionState>(
  PredictionNotifier.new,
);

class PredictionNotifier extends Notifier<PredictionState> {
  final PredictionRepository _repository =
      PredictionRepository();

  @override
  PredictionState build() {
    return const PredictionState();
  }

  Future<void> generatePrediction() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      // Génère la prédiction
      await _repository.generatePrediction();

      // Recharge immédiatement la dernière prédiction
      final latest =
          await _repository.getLatestPrediction();

      state = state.copyWith(
        prediction: latest.data,
      );
    } catch (e) {
      debugPrint(e.toString());

      String message = e.toString();

      if (message.contains("trois cycles")) {
        message =
            "Enregistrez au moins trois cycles pour générer une prédiction.";
      }

      state = state.copyWith(
        error: message,
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<void> loadLatestPrediction() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.getLatestPrediction();

      state = state.copyWith(
        prediction: response.data,
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