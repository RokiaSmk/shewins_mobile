import '../models/prediction.dart';

class PredictionState {
  final bool isLoading;

  final Prediction? prediction;

  final String? error;

  const PredictionState({
    this.isLoading = false,
    this.prediction,
    this.error,
  });

  PredictionState copyWith({
    bool? isLoading,
    Prediction? prediction,
    String? error,
  }) {
    return PredictionState(
      isLoading: isLoading ?? this.isLoading,
      prediction: prediction ?? this.prediction,
      error: error,
    );
  }
}