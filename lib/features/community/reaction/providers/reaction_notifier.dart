import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/reaction_repository.dart';
import '../requests/create_reaction_request.dart';

import 'reaction_state.dart';

final reactionProvider =
    NotifierProvider<ReactionNotifier, ReactionState>(
  ReactionNotifier.new,
);

class ReactionNotifier
    extends Notifier<ReactionState> {
  final ReactionRepository _repository =
      ReactionRepository();

  @override
  ReactionState build() {
    return const ReactionState();
  }

  Future<void> reactToPublication(
    String publicationId,
    CreateReactionRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.reactToPublication(
        publicationId,
        request,
      );

      state = state.copyWith(
        reaction: response.data,
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

  Future<void> removeReaction(
    String publicationId,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository.removeReaction(
        publicationId,
      );

      state = state.copyWith(
        reaction: null,
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