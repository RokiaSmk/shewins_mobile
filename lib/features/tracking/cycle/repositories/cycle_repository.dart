import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../requests/create_cycle_profile_request.dart';
import '../requests/update_cycle_profile_request.dart';
import '../requests/start_cycle_request.dart';
import '../requests/finish_cycle_request.dart';

import '../responses/cycle_profile_response.dart';
import '../responses/menstrual_cycle_list_response.dart';
import '../responses/menstrual_cycle_response.dart';

class CycleRepository {
  final Dio _dio = ApiClient.dio;

  // ==========================
  // Cycle Profile
  // ==========================

  Future<CycleProfileResponse> createProfile(
    CreateCycleProfileRequest request,
  ) async {
    final response = await _dio.post(
      ApiConstants.cycleProfile,
      data: request.toJson(),
    );

    return CycleProfileResponse.fromJson(response.data);
  }

  Future<CycleProfileResponse> getProfile() async {
    final response = await _dio.get(
      ApiConstants.cycleProfile,
    );

    return CycleProfileResponse.fromJson(response.data);
  }

  Future<CycleProfileResponse> updateProfile(
    UpdateCycleProfileRequest request,
  ) async {
    final response = await _dio.put(
      ApiConstants.cycleProfile,
      data: request.toJson(),
    );

    return CycleProfileResponse.fromJson(response.data);
  }

  // ==========================
  // Menstrual Cycle
  // ==========================

  Future<MenstrualCycleResponse> startCycle(
    StartCycleRequest request,
  ) async {
    final response = await _dio.post(
      ApiConstants.startCycle,
      data: request.toJson(),
    );

    return MenstrualCycleResponse.fromJson(response.data);
  }

  Future<MenstrualCycleResponse> finishCycle(
    String cycleId,
    FinishCycleRequest request,
  ) async {
    final response = await _dio.patch(
      "${ApiConstants.cycles}/$cycleId/finish",
      data: request.toJson(),
    );

    return MenstrualCycleResponse.fromJson(response.data);
  }

  Future<MenstrualCycleListResponse> getMyCycles() async {
    final response = await _dio.get(
      ApiConstants.cycles,
    );

    return MenstrualCycleListResponse.fromJson(response.data);
  }

  Future<MenstrualCycleResponse> getCycle(
    String cycleId,
  ) async {
    final response = await _dio.get(
      "${ApiConstants.cycles}/$cycleId",
    );

    return MenstrualCycleResponse.fromJson(response.data);
  }

  Future<void> deleteCycle(
    String cycleId,
  ) async {
    await _dio.delete(
      "${ApiConstants.cycles}/$cycleId",
    );
  }
}