import '../models/enums/reaction_type.dart';

class CreateReactionRequest {
  final ReactionType reactionType;

  const CreateReactionRequest({
    required this.reactionType,
  });

  Map<String, dynamic> toJson() {
    return {
      "reactionType": reactionType.value,
    };
  }
}