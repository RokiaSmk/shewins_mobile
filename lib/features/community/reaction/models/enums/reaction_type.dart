enum ReactionType {
  helpful,
  support,
  thankYou,
}

extension ReactionTypeExtension on ReactionType {
  String get value {
    switch (this) {
      case ReactionType.helpful:
        return "HELPFUL";

      case ReactionType.support:
        return "SUPPORT";

      case ReactionType.thankYou:
        return "THANK_YOU";
    }
  }

  static ReactionType fromString(
    String value,
  ) {
    switch (value) {
      case "HELPFUL":
        return ReactionType.helpful;

      case "SUPPORT":
        return ReactionType.support;

      case "THANK_YOU":
        return ReactionType.thankYou;

      default:
        return ReactionType.helpful;
    }
  }
}