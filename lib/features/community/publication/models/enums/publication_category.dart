enum PublicationCategory {
  question("QUESTION"),
  experience("EXPERIENCE"),
  conseil("CONSEIL"),
  temoignage("TEMOIGNAGE");

  final String apiValue;

  const PublicationCategory(
    this.apiValue,
  );

  factory PublicationCategory.fromJson(
    String value,
  ) {
    return PublicationCategory.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }
}