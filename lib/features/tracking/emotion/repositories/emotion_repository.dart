import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../requests/create_emotion_request.dart';
import '../requests/update_emotion_request.dart';

import '../responses/emotion_list_response.dart';
import '../responses/emotion_response.dart';

class EmotionRepository {
  final Dio _dio = ApiClient.dio;

  Future<EmotionResponse> createEmotion(
    CreateEmotionRequest request,
  ) async {
    final response = await _dio.post(
      ApiConstants.emotionJournal,
      data: request.toJson(),
    );

    return EmotionResponse.fromJson(response.data);
  }

  Future<EmotionListResponse> getCycleEmotions(
    String cycleId,
  ) async {
    final response = await _dio.get(
      "${ApiConstants.cycles}/$cycleId/emotion-journal",
    );

    return EmotionListResponse.fromJson(response.data);
  }

  Future<EmotionListResponse> getMemberEmotions() async {
    final response = await _dio.get(
      ApiConstants.emotionJournal,
    );

    return EmotionListResponse.fromJson(response.data);
  }

  Future<EmotionResponse> updateEmotion(
    String journalId,
    UpdateEmotionRequest request,
  ) async {
    final response = await _dio.put(
      "${ApiConstants.emotionJournal}/$journalId",
      data: request.toJson(),
    );

    return EmotionResponse.fromJson(response.data);
  }

  Future<void> deleteEmotion(
    String journalId,
  ) async {
    await _dio.delete(
      "${ApiConstants.emotionJournal}/$journalId",
    );
  }
}