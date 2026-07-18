import '../models/publication.dart';

class PublicationState {
  final bool isLoading;

  final String? error;

  final List<Publication> publications;

  final List<Publication> myPublications;

  final Publication? selectedPublication;

  const PublicationState({
    this.isLoading = false,
    this.error,
    this.publications = const [],
    this.myPublications = const [],
    this.selectedPublication,
  });

  PublicationState copyWith({
    bool? isLoading,
    String? error,
    List<Publication>? publications,
    List<Publication>? myPublications,
    Publication? selectedPublication,
  }) {
    return PublicationState(
      isLoading:
          isLoading ?? this.isLoading,
      error: error,
      publications:
          publications ?? this.publications,
      myPublications:
          myPublications ??
              this.myPublications,
      selectedPublication:
          selectedPublication ??
              this.selectedPublication,
    );
  }
}