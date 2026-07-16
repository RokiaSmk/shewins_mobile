class CycleProfile {
  final String memberId;
  final int averageCycleLength;
  final int averagePeriodLength;
  final bool regularCycle;

  const CycleProfile({
    required this.memberId,
    required this.averageCycleLength,
    required this.averagePeriodLength,
    required this.regularCycle,
  });

  factory CycleProfile.fromJson(Map<String, dynamic> json) {
    return CycleProfile(
      memberId: json["memberId"],
      averageCycleLength: json["averageCycleLength"],
      averagePeriodLength: json["averagePeriodLength"],
      regularCycle: json["regularCycle"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "memberId": memberId,
      "averageCycleLength": averageCycleLength,
      "averagePeriodLength": averagePeriodLength,
      "regularCycle": regularCycle,
    };
  }
}