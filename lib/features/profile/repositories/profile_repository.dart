import '../models/profile_request.dart';
import '../models/profile_response.dart';
import '../services/profile_service.dart';

class ProfileRepository {

  final ProfileService _service = ProfileService();

  Future<ProfileResponse> createProfile(
      ProfileRequest request) async {

    return await _service.createProfile(request);
  }

  Future<ProfileResponse> getProfile() async {

    return await _service.getProfile();
  }

  Future<ProfileResponse> updateProfile(
      ProfileRequest request) async {

    return await _service.updateProfile(request);
  }
}