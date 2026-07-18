import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/report_state.dart';
import '../repositories/report_repository.dart';
import '../requests/generate_report_request.dart';

final reportProvider =
    NotifierProvider<ReportNotifier, ReportState>(
  ReportNotifier.new,
);

class ReportNotifier extends Notifier<ReportState> {
  final ReportRepository _repository =
      ReportRepository();

  @override
  ReportState build() {
    return const ReportState();
  }

  Future<void> generateReport() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.generateReport(
        const GenerateReportRequest(),
      );

      state = state.copyWith(
        report: response.data,
      );

      await loadReports();
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<void> loadReports() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.getReports();

      state = state.copyWith(
        reports: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<void> loadReport(
    String reportId,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.getReport(
        reportId,
      );

      state = state.copyWith(
        report: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }
}