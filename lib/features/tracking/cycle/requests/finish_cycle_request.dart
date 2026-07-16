import '../models/enums/flow_intensity.dart';

class FinishCycleRequest {
  final DateTime endDate;
  final FlowIntensity flowIntensity;

  const FinishCycleRequest({
    required this.endDate,
    required this.flowIntensity,
  });

  Map<String, dynamic> toJson() {
    return {
      "endDate": endDate.toIso8601String(),
      "flowIntensity": flowIntensity.apiValue,
    };
  }
}