enum ReportStatus {
  pending,
  underReview,
  resolved,
  rejected,
}

extension ReportStatusExtension on ReportStatus {
  static ReportStatus fromString(String value) {
    switch (value) {
      case "PENDING":
        return ReportStatus.pending;

      case "UNDER_REVIEW":
        return ReportStatus.underReview;

      case "RESOLVED":
        return ReportStatus.resolved;

      default:
        return ReportStatus.rejected;
    }
  }
}