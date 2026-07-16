class CreateMenstrualCycleRequest {
  final DateTime startDate;

  const CreateMenstrualCycleRequest({
    required this.startDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "startDate": startDate.toIso8601String(),
    };
  }
}