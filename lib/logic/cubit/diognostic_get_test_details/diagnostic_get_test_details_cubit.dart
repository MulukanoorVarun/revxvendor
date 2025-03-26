import 'package:flutter_bloc/flutter_bloc.dart';

import 'diagnostic_get_test_details_repository.dart';
import 'diagnostic_get_test_details_state.dart';

class DiagnosticTestDetailsCubit extends Cubit<DiagnosticTestDetailsState> {
  DiagnosticTestDetailsRepository diagnosticTestDetailsRepository;
  DiagnosticTestDetailsCubit(this.diagnosticTestDetailsRepository)
    : super(DiagnosticTestDetailsIntailly());

  Future<void> getTestDetails(id) async {
    emit(DiagnosticTestDetailsLoading());
    try {
      final res = await diagnosticTestDetailsRepository.getTestDetails(id);
      if (res != null) {
        emit(DiagnosticTestDetailsLoaded(res));
      } else {
        emit(DiagnosticTestDetailsError("${res?.settings?.message?? 'No details found for the given ID'}"));
      }
    } catch (e) {
      emit(DiagnosticTestDetailsError(e.toString()));
    }
  }
}
