import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'publication_state.dart';

import '../repositories/publication_repository.dart';

import '../requests/create_publication_request.dart';
import '../requests/update_publication_request.dart';

final publicationProvider =
    NotifierProvider<
        PublicationNotifier,
        PublicationState>(
  PublicationNotifier.new,
);

class PublicationNotifier
    extends Notifier<PublicationState> {
  final PublicationRepository _repository =
      PublicationRepository();

  @override
  PublicationState build() {
    return const PublicationState();
  }

  Future<void> loadAllPublications() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository
              .getAllPublications();

      state = state.copyWith(
        publications: response.data,
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

  Future<void> loadMyPublications() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository
              .getMyPublications();

      state = state.copyWith(
        myPublications:
            response.data,
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

  Future<void> loadPublication(
    String publicationId,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository
              .getPublication(
        publicationId,
      );

      state = state.copyWith(
        selectedPublication:
            response.data,
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

  Future<void> createPublication(
    CreatePublicationRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository
          .createPublication(
        request,
      );

      await loadAllPublications();
      await loadMyPublications();
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

  Future<void> updatePublication(
    String publicationId,
    UpdatePublicationRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository
              .updatePublication(
        publicationId,
        request,
      );

      state = state.copyWith(
        selectedPublication:
            response.data,
      );

      await loadAllPublications();
      await loadMyPublications();
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

  Future<void> deletePublication(
    String publicationId,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      await _repository
          .deletePublication(
        publicationId,
      );

      await loadAllPublications();
      await loadMyPublications();
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