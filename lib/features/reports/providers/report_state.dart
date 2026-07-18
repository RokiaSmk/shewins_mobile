import '../models/medical_report.dart';

class ReportState {
  final bool isLoading;
  final String? error;

  final List<MedicalReport> reports;

  final MedicalReport? report;

  const ReportState({
    this.isLoading = false,
    this.error,
    this.reports = const [],
    this.report,
  });

  ReportState copyWith({
    bool? isLoading,
    String? error,
    List<MedicalReport>? reports,
    MedicalReport? report,
  }) {
    return ReportState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      reports: reports ?? this.reports,
      report: report ?? this.report,
    );
  }
}