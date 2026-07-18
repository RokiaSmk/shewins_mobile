enum NotificationChannel {
  email("EMAIL"),
  inApp("IN_APP");

  final String apiValue;

  const NotificationChannel(
    this.apiValue,
  );

  factory NotificationChannel.fromJson(
    String value,
  ) {
    return NotificationChannel.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }
}