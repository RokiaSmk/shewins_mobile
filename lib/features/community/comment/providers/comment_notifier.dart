import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/comment_repository.dart';

import '../requests/create_comment_request.dart';
import '../requests/update_comment_request.dart';

import 'comment_state.dart';

final commentProvider =
    NotifierProvider<CommentNotifier, CommentState>(
  CommentNotifier.new,
);

class CommentNotifier
    extends Notifier<CommentState> {

  final CommentRepository _repository =
      CommentRepository();

  @override
  CommentState build() {
    return const CommentState();
  }

  Future<void> loadComments(
    String publicationId,
  ) async {

    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {

      final response =
          await _repository
              .getPublicationComments(
        publicationId,
      );

      state = state.copyWith(
        comments: response.data,
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

  Future<void> createComment(
    String publicationId,
    CreateCommentRequest request,
  ) async {

    try {

      await _repository.createComment(
        publicationId,
        request,
      );

      await loadComments(
        publicationId,
      );

    } catch (e) {

      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );

    }
  }

  Future<void> updateComment(
    String publicationId,
    String commentId,
    UpdateCommentRequest request,
  ) async {

    try {

      await _repository.updateComment(
        commentId,
        request,
      );

      await loadComments(
        publicationId,
      );

    } catch (e) {

      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );

    }
  }

  Future<void> deleteComment(
    String publicationId,
    String commentId,
  ) async {

    try {

      await _repository.deleteComment(
        commentId,
      );

      await loadComments(
        publicationId,
      );

    } catch (e) {

      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );

    }
  }
}