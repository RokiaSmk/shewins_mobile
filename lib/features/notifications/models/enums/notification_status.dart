enum NotificationStatus {
  pending("PENDING"),
  sent("SENT"),
  failed("FAILED");

  final String apiValue;

  const NotificationStatus(
    this.apiValue,
  );

  factory NotificationStatus.fromJson(
    String value,
  ) {
    return NotificationStatus.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }
}