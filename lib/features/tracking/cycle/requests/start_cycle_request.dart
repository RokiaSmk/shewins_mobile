class StartCycleRequest {
  final DateTime startDate;

  const StartCycleRequest({
    required this.startDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "startDate": startDate.toIso8601String(),
    };
  }
}