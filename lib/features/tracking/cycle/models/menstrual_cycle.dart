import 'enums/cycle_status.dart';
import 'enums/flow_intensity.dart';

class MenstrualCycle {
  final String id;
  final DateTime startDate;
  final DateTime? endDate;
  final int? actualPeriodLength;
  final FlowIntensity? flowIntensity;
  final CycleStatus status;

  const MenstrualCycle({
    required this.id,
    required this.startDate,
    this.endDate,
    this.actualPeriodLength,
    this.flowIntensity,
    required this.status,
  });

  factory MenstrualCycle.fromJson(Map<String, dynamic> json) {
    return MenstrualCycle(
      id: json["id"],
      startDate: DateTime.parse(json["startDate"]),
      endDate: json["endDate"] != null
          ? DateTime.parse(json["endDate"])
          : null,
      actualPeriodLength: json["actualPeriodLength"],
      flowIntensity: json["flowIntensity"] != null
          ? FlowIntensity.fromJson(json["flowIntensity"])
          : null,
      status: CycleStatus.fromJson(json["status"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "startDate": startDate.toIso8601String(),
      "endDate": endDate?.toIso8601String(),
      "actualPeriodLength": actualPeriodLength,
      "flowIntensity": flowIntensity?.apiValue,
      "status": status.apiValue,
    };
  }
}