import 'blood_group.dart';

class ProfileRequest {
  final DateTime dateOfBirth;
  final double height;
  final double weight;
  final BloodGroup bloodGroup;
  final String country;
  final String city;
  final String phoneNumber;
  final String profilePicture;
  final String bio;

  const ProfileRequest({
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.bloodGroup,
    required this.country,
    required this.city,
    required this.phoneNumber,
    required this.profilePicture,
    required this.bio,
  });

  Map<String, dynamic> toJson() {
    return {
      "dateOfBirth": dateOfBirth.toIso8601String().split("T").first,
      "height": height,
      "weight": weight,
      "bloodGroup": bloodGroup.apiValue,
      "country": country,
      "city": city,
      "phoneNumber": phoneNumber,
      "profilePicture": profilePicture,
      "bio": bio,
    };
  }
}
