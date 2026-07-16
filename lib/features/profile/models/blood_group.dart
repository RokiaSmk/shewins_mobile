enum BloodGroup {
  aPositive,
  aNegative,
  bPositive,
  bNegative,
  abPositive,
  abNegative,
  oPositive,
  oNegative,
}

extension BloodGroupExtension on BloodGroup {
  String get apiValue {
    switch (this) {
      case BloodGroup.aPositive:
        return "A_POSITIVE";

      case BloodGroup.aNegative:
        return "A_NEGATIVE";

      case BloodGroup.bPositive:
        return "B_POSITIVE";

      case BloodGroup.bNegative:
        return "B_NEGATIVE";

      case BloodGroup.abPositive:
        return "AB_POSITIVE";

      case BloodGroup.abNegative:
        return "AB_NEGATIVE";

      case BloodGroup.oPositive:
        return "O_POSITIVE";

      case BloodGroup.oNegative:
        return "O_NEGATIVE";
    }
  }

  String get label {
    switch (this) {
      case BloodGroup.aPositive:
        return "A+";

      case BloodGroup.aNegative:
        return "A−";

      case BloodGroup.bPositive:
        return "B+";

      case BloodGroup.bNegative:
        return "B−";

      case BloodGroup.abPositive:
        return "AB+";

      case BloodGroup.abNegative:
        return "AB−";

      case BloodGroup.oPositive:
        return "O+";

      case BloodGroup.oNegative:
        return "O−";
    }
  }
  
}