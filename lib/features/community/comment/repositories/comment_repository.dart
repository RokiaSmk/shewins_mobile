import 'package:dio/dio.dart';

import '../../../../../core/network/api_client.dart';

import '../requests/create_comment_request.dart';
import '../requests/update_comment_request.dart';

import '../responses/comment_list_response.dart';
import '../responses/comment_response.dart';
import '../../../../core/network/api_constants.dart';

class CommentRepository {
  final Dio _dio = ApiClient.dio;

  Future<CommentListResponse>
      getPublicationComments(
    String publicationId,
  ) async {
    final response = await _dio.get(
      "${ApiConstants.publications}/$publicationId/comments",
    );

    return CommentListResponse.fromJson(
      response.data,
    );
  }

  Future<CommentResponse> createComment(
    String publicationId,
    CreateCommentRequest request,
  ) async {
    final response = await _dio.post(
      "${ApiConstants.publications}/$publicationId/comments",
      data: request.toJson(),
    );

    return CommentResponse.fromJson(
      response.data,
    );
  }

  Future<CommentResponse> updateComment(
    String commentId,
    UpdateCommentRequest request,
  ) async {
    final response = await _dio.put(
      "${ApiConstants.comments}/$commentId",
      data: request.toJson(),
    );

    return CommentResponse.fromJson(
      response.data,
    );
  }

  Future<void> deleteComment(
    String commentId,
  ) async {
    await _dio.delete(
      "${ApiConstants.comments}/$commentId",
    );
  }
}