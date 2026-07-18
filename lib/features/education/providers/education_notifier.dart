import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/education_response.dart';
import '../repositories/education_repository.dart';
import 'education_state.dart';

final educationProvider =
    NotifierProvider<EducationNotifier, EducationState>(
  EducationNotifier.new,
);

class EducationNotifier extends Notifier<EducationState> {
  final EducationRepository _repository = EducationRepository();

  @override
  EducationState build() {
    Future.microtask(loadContents);
    return const EducationState();
  }

  Future<void> loadContents() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final contents = await _repository.getContents();

      state = state.copyWith(
        isLoading: false,
        contents: contents,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    await loadContents();
  }

  Future<EducationResponse?> getContent(String id) async {
    try {
      return await _repository.getContentById(id);
    } catch (_) {
      return null;
    }
  }

  void search(String value) {
    state = state.copyWith(
      search: value,
    );
  }
}