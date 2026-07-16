import '../../../core/network/api_client.dart';
import '../../../core/network/api_constants.dart';
import '../models/profile_request.dart';
import '../models/profile_response.dart';

class ProfileService {

  Future<ProfileResponse> createProfile(
      ProfileRequest request) async {

    final response = await ApiClient.dio.post(
      ApiConstants.profile,
      data: request.toJson(),
    );

    return ProfileResponse.fromJson(response.data);
  }

  Future<ProfileResponse> getProfile() async {

    final response = await ApiClient.dio.get(
      ApiConstants.profileMe,
    );

    return ProfileResponse.fromJson(response.data);
  }

  Future<ProfileResponse> updateProfile(
      ProfileRequest request) async {

    final response = await ApiClient.dio.put(
      ApiConstants.profileMe,
      data: request.toJson(),
    );

    return ProfileResponse.fromJson(response.data);
  }
}