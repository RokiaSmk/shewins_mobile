import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/symptom_repository.dart';

import '../providers/symptom_state.dart';

import '../requests/create_symptom_request.dart';
import '../requests/update_symptom_request.dart';

final symptomProvider =
    NotifierProvider<SymptomNotifier, SymptomState>(
  SymptomNotifier.new,
);

class SymptomNotifier extends Notifier<SymptomState> {
  final SymptomRepository _repository =
      SymptomRepository();

  @override
  SymptomState build() {
    return const SymptomState();
  }

  Future<bool> createSymptom(
    CreateSymptomRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.createSymptom(request);

      await loadMemberSymptoms();

      return true;
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );

      return false;
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<void> loadCycleSymptoms(
    String cycleId,
  ) async {
    try {
      final response =
          await _repository.getCycleSymptoms(
        cycleId,
      );

      state = state.copyWith(
        symptoms: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadMemberSymptoms() async {
    try {
      final response =
          await _repository.getMemberSymptoms();

      state = state.copyWith(
        symptoms: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> updateSymptom(
    String symptomId,
    UpdateSymptomRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.updateSymptom(
        symptomId,
        request,
      );

      await loadMemberSymptoms();

      return true;
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );

      return false;
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<void> deleteSymptom(
    String symptomId,
  ) async {
    try {
      await _repository.deleteSymptom(
        symptomId,
      );

      await loadMemberSymptoms();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  
}