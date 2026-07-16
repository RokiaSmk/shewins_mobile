import '../models/symptom.dart';

class SymptomState {
  final bool isLoading;
  final List<Symptom> symptoms;
  final String? error;

  const SymptomState({
    this.isLoading = false,
    this.symptoms = const [],
    this.error,
  });

  SymptomState copyWith({
    bool? isLoading,
    List<Symptom>? symptoms,
    String? error,
  }) {
    return SymptomState(
      isLoading: isLoading ?? this.isLoading,
      symptoms: symptoms ?? this.symptoms,
      error: error,
    );
  }
}