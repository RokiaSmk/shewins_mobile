import '../models/education_response.dart';

class EducationState {
  final bool isLoading;
  final String? error;
  final List<EducationResponse> contents;
  final String search;

  const EducationState({
    this.isLoading = false,
    this.error,
    this.contents = const [],
    this.search = '',
  });

  EducationState copyWith({
    bool? isLoading,
    String? error,
    List<EducationResponse>? contents,
    String? search,
  }) {
    return EducationState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      contents: contents ?? this.contents,
      search: search ?? this.search,
    );
  }
}