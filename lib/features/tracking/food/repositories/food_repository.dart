import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../requests/create_food_journal_request.dart';
import '../requests/update_food_journal_request.dart';

import '../responses/food_journal_list_response.dart';
import '../responses/food_journal_response.dart';

class FoodRepository {
  final Dio _dio = ApiClient.dio;

  Future<FoodJournalResponse> createFoodJournal(
    CreateFoodJournalRequest request,
  ) async {
    final response = await _dio.post(
      ApiConstants.foodJournal,
      data: request.toJson(),
    );

    return FoodJournalResponse.fromJson(response.data);
  }

  Future<FoodJournalListResponse> getCycleFoodJournals(
    String cycleId,
  ) async {
    final response = await _dio.get(
      "${ApiConstants.cycles}/$cycleId/food-journal",
    );

    return FoodJournalListResponse.fromJson(response.data);
  }

  Future<FoodJournalListResponse> getMemberFoodJournals() async {
    final response = await _dio.get(
      ApiConstants.foodJournal,
    );

    return FoodJournalListResponse.fromJson(response.data);
  }

  Future<FoodJournalResponse> updateFoodJournal(
    String journalId,
    UpdateFoodJournalRequest request,
  ) async {
    final response = await _dio.put(
      "${ApiConstants.foodJournal}/$journalId",
      data: request.toJson(),
    );

    return FoodJournalResponse.fromJson(response.data);
  }

  Future<void> deleteFoodJournal(
    String journalId,
  ) async {
    await _dio.delete(
      "${ApiConstants.foodJournal}/$journalId",
    );
  }
}