class CreateCycleProfileRequest {
  final int averageCycleLength;
  final int averagePeriodLength;
  final bool regularCycle;

  const CreateCycleProfileRequest({
    required this.averageCycleLength,
    required this.averagePeriodLength,
    required this.regularCycle,
  });

  Map<String, dynamic> toJson() {
    return {
      "averageCycleLength": averageCycleLength,
      "averagePeriodLength": averagePeriodLength,
      "regularCycle": regularCycle,
    };
  }
}