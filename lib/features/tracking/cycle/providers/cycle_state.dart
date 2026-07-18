import '../models/cycle_profile.dart';
import '../models/menstrual_cycle.dart';

class CycleState {
  final bool isLoading;
  final CycleProfile? profile;
  final List<MenstrualCycle> cycles;
  final String? error;

  const CycleState({
    this.isLoading = false,
    this.profile,
    this.cycles = const [],
    this.error,
  });

  CycleState copyWith({
  bool? isLoading,
  CycleProfile? profile,
  List<MenstrualCycle>? cycles,
  MenstrualCycle? selectedCycle,
  String? error,
}) {
  return CycleState(
    isLoading: isLoading ?? this.isLoading,
    profile: profile ?? this.profile,
    cycles: cycles ?? this.cycles,
    error: error,
  );
}
}