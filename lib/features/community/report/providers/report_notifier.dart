import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/report_repository.dart';
import '../requests/create_report_request.dart';
import 'report_state.dart';

final reportProvider =
    NotifierProvider<ReportNotifier, ReportState>(
  ReportNotifier.new,
);

class ReportNotifier extends Notifier<ReportState> {
  final ReportRepository repository =
      ReportRepository();

  @override
  ReportState build() {
    return const ReportState();
  }

  Future<void> reportPublication(
    String publicationId,
    CreateReportRequest request,
  ) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await repository.reportPublication(
        publicationId,
        request,
      );

      state = state.copyWith(
        isLoading: false,
        report: response.data,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}