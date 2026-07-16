import 'enums/symptom_intensity.dart';
import 'enums/symptom_type.dart';

class Symptom {
  final String id;
  final String cycleId;
  final SymptomType symptomType;
  final SymptomIntensity intensity;
  final String? note;

  const Symptom({
    required this.id,
    required this.cycleId,
    required this.symptomType,
    required this.intensity,
    this.note,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      id: json["id"],
      cycleId: json["cycleId"],
      symptomType: SymptomType.fromJson(
        json["symptomType"],
      ),
      intensity: SymptomIntensity.fromJson(
        json["intensity"],
      ),
      note: json["note"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "cycleId": cycleId,
      "symptomType": symptomType.apiValue,
      "intensity": intensity.apiValue,
      "note": note,
    };
  }
}