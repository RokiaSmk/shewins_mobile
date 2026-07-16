enum SymptomType {
  cramps,
  headache,
  backPain,
  bloating,
  breastTenderness,
  nausea,
  fatigue,
  acne,
  moodSwings,
  other;

  String get apiValue {
    switch (this) {
      case SymptomType.cramps:
        return "CRAMPS";
      case SymptomType.headache:
        return "HEADACHE";
      case SymptomType.backPain:
        return "BACK_PAIN";
      case SymptomType.bloating:
        return "BLOATING";
      case SymptomType.breastTenderness:
        return "BREAST_TENDERNESS";
      case SymptomType.nausea:
        return "NAUSEA";
      case SymptomType.fatigue:
        return "FATIGUE";
      case SymptomType.acne:
        return "ACNE";
      case SymptomType.moodSwings:
        return "MOOD_SWINGS";
      case SymptomType.other:
        return "OTHER";
    }
  }

  static SymptomType fromJson(String value) {
    return SymptomType.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }

  String get label {
    switch (this) {
      case SymptomType.cramps:
        return "Crampes";
      case SymptomType.headache:
        return "Maux de tête";
      case SymptomType.backPain:
        return "Douleurs du dos";
      case SymptomType.bloating:
        return "Ballonnements";
      case SymptomType.breastTenderness:
        return "Sensibilité des seins";
      case SymptomType.nausea:
        return "Nausées";
      case SymptomType.fatigue:
        return "Fatigue";
      case SymptomType.acne:
        return "Acné";
      case SymptomType.moodSwings:
        return "Sautes d'humeur";
      case SymptomType.other:
        return "Autre";
    }
  }
}