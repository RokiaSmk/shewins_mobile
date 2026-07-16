import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cycle_state.dart';

import '../repositories/cycle_repository.dart';
import '../models/menstrual_cycle.dart';
import '../models/enums/cycle_status.dart';
import '../requests/create_cycle_profile_request.dart';
import '../requests/update_cycle_profile_request.dart';
import '../requests/start_cycle_request.dart';
import '../requests/finish_cycle_request.dart';

final cycleProvider =
    NotifierProvider<CycleNotifier, CycleState>(
  CycleNotifier.new,
);

class CycleNotifier extends Notifier<CycleState> {
  final CycleRepository _repository = CycleRepository();

  @override
  CycleState build() {
    return const CycleState();
  }

  // ==========================
  // Cycle Profile
  // ==========================

  Future<bool> createProfile(
    CreateCycleProfileRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.createProfile(request);

      state = state.copyWith(
        profile: response.data,
      );

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


  Future<bool> updateProfile(
    UpdateCycleProfileRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.updateProfile(request);

      state = state.copyWith(
        profile: response.data,
      );

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

  // ==========================
  // Menstrual Cycles
  // ==========================

  Future<bool> startCycle(
    StartCycleRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.startCycle(request);

      await loadCycles();

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

  Future<bool> finishCycle(
    String cycleId,
    FinishCycleRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.finishCycle(
        cycleId,
        request,
      );

      await loadCycles();

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

  Future<void> deleteCycle(
    String cycleId,
  ) async {
    try {
      await _repository.deleteCycle(
        cycleId,
      );

      await loadCycles();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  Future<void> loadCycleProfile() async {
  try {
    final response = await _repository.getProfile();

    state = state.copyWith(
      profile: response.data,
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}
Future<void> loadCycles() async {
  try {
    final response = await _repository.getMyCycles();

    state = state.copyWith(
      cycles: response.data,
    );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
    MenstrualCycle? get currentCycle {
    try {
      return state.cycles.firstWhere(
        (cycle) => cycle.status == CycleStatus.ongoing,
      );
    } catch (_) {
      return null;
    }
  }
}