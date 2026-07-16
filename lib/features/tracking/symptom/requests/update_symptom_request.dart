import '../models/enums/symptom_intensity.dart';
import '../models/enums/symptom_type.dart';

class UpdateSymptomRequest {
  final SymptomType symptomType;
  final SymptomIntensity intensity;
  final String? note;

  const UpdateSymptomRequest({
    required this.symptomType,
    required this.intensity,
    this.note,
  });

  Map<String, dynamic> toJson() {
    return {
      "symptomType": symptomType.apiValue,
      "intensity": intensity.apiValue,
      "note": note,
    };
  }
}