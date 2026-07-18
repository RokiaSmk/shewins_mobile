enum NotificationType {
  periodReminder("PERIOD_REMINDER"),
  ovulationReminder("OVULATION_REMINDER"),
  fertilityReminder("FERTILITY_REMINDER"),
  appointmentReminder("APPOINTMENT_REMINDER"),
  healthReport("HEALTH_REPORT"),
  healthInsight("HEALTH_INSIGHT"),
  system("SYSTEM");

  final String apiValue;

  const NotificationType(this.apiValue);

  factory NotificationType.fromJson(
    String value,
  ) {
    return NotificationType.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }
}