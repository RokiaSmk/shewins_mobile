import '../models/enums/symptom_intensity.dart';
import '../models/enums/symptom_type.dart';

class CreateSymptomRequest {
  final String cycleId;
  final SymptomType symptomType;
  final SymptomIntensity intensity;
  final String? note;

  const CreateSymptomRequest({
    required this.cycleId,
    required this.symptomType,
    required this.intensity,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      "cycleId": cycleId,
      "symptomType": symptomType.apiValue,
      "intensity": intensity.apiValue,
      "note": note,
    };
  }
}