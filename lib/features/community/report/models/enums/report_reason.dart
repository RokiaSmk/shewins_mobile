enum ReportReason {
  spam,
  harassment,
  medicalMisinformation,
  inappropriateContent,
  other,
}

extension ReportReasonExtension on ReportReason {
  String get value {
    switch (this) {
      case ReportReason.spam:
        return "SPAM";

      case ReportReason.harassment:
        return "HARASSMENT";

      case ReportReason.medicalMisinformation:
        return "MEDICAL_MISINFORMATION";

      case ReportReason.inappropriateContent:
        return "INAPPROPRIATE_CONTENT";

      case ReportReason.other:
        return "OTHER";
    }
  }

  static ReportReason fromString(String value) {
    switch (value) {
      case "SPAM":
        return ReportReason.spam;

      case "HARASSMENT":
        return ReportReason.harassment;

      case "MEDICAL_MISINFORMATION":
        return ReportReason.medicalMisinformation;

      case "INAPPROPRIATE_CONTENT":
        return ReportReason.inappropriateContent;

      default:
        return ReportReason.other;
    }
  }
}