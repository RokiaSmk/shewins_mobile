import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/food_state.dart';

import '../repositories/food_repository.dart';

import '../requests/create_food_journal_request.dart';
import '../requests/update_food_journal_request.dart';

final foodProvider =
    NotifierProvider<FoodNotifier, FoodState>(
  FoodNotifier.new,
);

class FoodNotifier extends Notifier<FoodState> {
  final FoodRepository _repository =
      FoodRepository();

  @override
  FoodState build() {
    return const FoodState();
  }

  Future<bool> createFoodJournal(
    CreateFoodJournalRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.createFoodJournal(
        request,
      );

      await loadMemberFoodJournals();

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

  Future<void> loadCycleFoodJournals(
    String cycleId,
  ) async {
    try {
      final response =
          await _repository.getCycleFoodJournals(
        cycleId,
      );

      state = state.copyWith(
        journals: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadMemberFoodJournals() async {
    try {
      final response =
          await _repository
              .getMemberFoodJournals();

      state = state.copyWith(
        journals: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> updateFoodJournal(
    String journalId,
    UpdateFoodJournalRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.updateFoodJournal(
        journalId,
        request,
      );

      await loadMemberFoodJournals();

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

  Future<void> deleteFoodJournal(
    String journalId,
  ) async {
    try {
      await _repository.deleteFoodJournal(
        journalId,
      );

      await loadMemberFoodJournals();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}