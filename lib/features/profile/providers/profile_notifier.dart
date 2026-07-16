import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/profile_request.dart';
import '../models/profile_response.dart';
import '../repositories/profile_repository.dart';
import '../models/blood_group.dart';
import 'profile_state.dart';

final profileProvider =
  NotifierProvider<ProfileNotifier, ProfileState>(
    ProfileNotifier.new,
);

class ProfileNotifier extends Notifier<ProfileState> {
  final ProfileRepository _repository =
      ProfileRepository();

  @override
ProfileState build() {
  return const ProfileState();
}
  Future<ProfileResponse?> createProfile({
    required DateTime dateOfBirth,
    required double height,
    required double weight,
    required BloodGroup bloodGroup,
    required String country,
    required String city,
    required String phoneNumber,
    required String profilePicture,
    required String bio,
  }) async {
    state = state.copyWith(
      isLoading: true,
    );

    try {
      final response = await _repository.createProfile(
        ProfileRequest(
          dateOfBirth: dateOfBirth,
          height: height,
          weight: weight,
          bloodGroup: bloodGroup,
          country: country,
          city: city,
          phoneNumber: phoneNumber,
          profilePicture: profilePicture,
          bio: bio,
        ),
      );

      state = state.copyWith(
        profile: response.data,
      );

return response;
    } catch (e) {
      debugPrint("Erreur création profil : $e");
      return null;
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<ProfileResponse?> getProfile() async {
    state = state.copyWith(
      isLoading: true,
    );

    try {
      final response = await _repository.getProfile();

      state = state.copyWith(
        profile: response.data,
      );

      return response;
    } catch (e) {
      debugPrint("Erreur récupération profil : $e");
      return null;
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<ProfileResponse?> updateProfile({
    required DateTime dateOfBirth,
    required double height,
    required double weight,
    required BloodGroup bloodGroup,
    required String country,
    required String city,
    required String phoneNumber,
    required String profilePicture,
    required String bio,
  }) async {
    state = state.copyWith(
      isLoading: true,
    );

    try {
      final response = await _repository.updateProfile(
      ProfileRequest(
        dateOfBirth: dateOfBirth,
        height: height,
        weight: weight,
        bloodGroup: bloodGroup,
        country: country,
        city: city,
        phoneNumber: phoneNumber,
        profilePicture: profilePicture,
        bio: bio,
      ),
    );

    state = state.copyWith(
      profile: response.data,
    );

return response;
    } catch (e) {
      debugPrint("Erreur mise à jour profil : $e");
      return null;
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }
  Future<void> loadProfile() async {
  state = state.copyWith(
    isLoading: true,
  );

  try {
    final response = await _repository.getProfile();

    state = state.copyWith(
      profile: response.data,
    );
  } catch (e) {
    debugPrint(
      "Erreur chargement profil : $e",
    );
  } finally {
    state = state.copyWith(
      isLoading: false,
    );
  }
}
}