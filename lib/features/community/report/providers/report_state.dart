import '../models/report.dart';

class ReportState {
  final bool isLoading;

  final Report? report;

  final String? error;

  const ReportState({
    this.isLoading = false,
    this.report,
    this.error,
  });

  ReportState copyWith({
    bool? isLoading,
    Report? report,
    String? error,
  }) {
    return ReportState(
      isLoading: isLoading ?? this.isLoading,
      report: report ?? this.report,
      error: error,
    );
  }
}