import 'blood_group.dart';

class ProfileResponse {
  final bool success;
  final String message;
  final UserProfile data;

  const ProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      success: json["success"],
      message: json["message"],
      data: UserProfile.fromJson(json["data"]),
    );
  }
}

class UserProfile {
  final String id;
  final String memberId;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final double height;
  final double weight;
  final BloodGroup bloodGroup;
  final String country;
  final String city;
  final String phoneNumber;
  final String profilePicture;
  final String bio;
  final bool profileCompleted;

  const UserProfile({
    required this.id,
    required this.memberId,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.bloodGroup,
    required this.country,
    required this.city,
    required this.phoneNumber,
    required this.profilePicture,
    required this.bio,
    required this.profileCompleted,
  });
  
  String get fullName => "$firstName $lastName";

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json["id"],
      memberId: json["memberId"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      dateOfBirth: DateTime.parse(json["dateOfBirth"]),
      height: (json["height"] as num).toDouble(),
      weight: (json["weight"] as num).toDouble(),
      bloodGroup: BloodGroup.values.firstWhere(
      (group) => group.apiValue == json["bloodGroup"],
    ),
      country: json["country"],
      city: json["city"],
      phoneNumber: json["phoneNumber"],
      profilePicture: json["profilePicture"] ?? "",
      bio: json["bio"] ?? "",
      profileCompleted: json["profileCompleted"],
    );
  }
}
