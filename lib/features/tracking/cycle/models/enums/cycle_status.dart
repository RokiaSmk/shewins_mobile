enum CycleStatus {
  ongoing,
  completed;

  String get apiValue {
    switch (this) {
      case CycleStatus.ongoing:
        return "ONGOING";
      case CycleStatus.completed:
        return "COMPLETED";
    }
  }

  static CycleStatus fromJson(String value) {
    return CycleStatus.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }
}