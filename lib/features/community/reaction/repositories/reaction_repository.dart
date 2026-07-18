import '../../../../core/network/api_client.dart';

import '../requests/create_reaction_request.dart';
import '../responses/reaction_response.dart';
import '../../../../core/network/api_constants.dart';

class ReactionRepository {
  Future<ReactionResponse> reactToPublication(
    String publicationId,
    CreateReactionRequest request,
  ) async {
    final response = await ApiClient.dio.post(
      "${ApiConstants.publications}/$publicationId/reactions",
      data: request.toJson(),
    );

    return ReactionResponse.fromJson(
      response.data,
    );
  }

  Future<void> removeReaction(
    String publicationId,
  ) async {
    await ApiClient.dio.delete(
      "${ApiConstants.publications}/$publicationId/reactions",
    );
  }
}