import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/emotion_state.dart';
import '../repositories/emotion_repository.dart';

import '../requests/create_emotion_request.dart';
import '../requests/update_emotion_request.dart';

final emotionProvider =
    NotifierProvider<EmotionNotifier, EmotionState>(
  EmotionNotifier.new,
);

class EmotionNotifier extends Notifier<EmotionState> {
  final EmotionRepository _repository =
      EmotionRepository();

  @override
  EmotionState build() {
    return const EmotionState();
  }

  Future<bool> createEmotion(
    CreateEmotionRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.createEmotion(request);

      await loadMemberEmotions();

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

  Future<void> loadCycleEmotions(
    String cycleId,
  ) async {
    try {
      final response =
          await _repository.getCycleEmotions(
        cycleId,
      );

      state = state.copyWith(
        emotions: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loadMemberEmotions() async {
    try {
      final response =
          await _repository.getMemberEmotions();

      state = state.copyWith(
        emotions: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> updateEmotion(
    String journalId,
    UpdateEmotionRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.updateEmotion(
        journalId,
        request,
      );

      await loadMemberEmotions();

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

  Future<void> deleteEmotion(
    String journalId,
  ) async {
    try {
      await _repository.deleteEmotion(
        journalId,
      );

      await loadMemberEmotions();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}