import 'enums/reaction_type.dart';

class Reaction {
  final String id;

  final String authorId;

  final ReactionType reactionType;

  const Reaction({
    required this.id,
    required this.authorId,
    required this.reactionType,
  });

  factory Reaction.fromJson(
    Map<String, dynamic> json,
  ) {
    return Reaction(
      id: json["id"],
      authorId: json["authorId"],
      reactionType:
          ReactionTypeExtension.fromString(
        json["reactionType"],
      ),
    );
  }
}