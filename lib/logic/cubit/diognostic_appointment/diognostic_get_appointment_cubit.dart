import 'package:flutter_bloc/flutter_bloc.dart';

import 'diognostic_get_appointment_repository.dart';
import 'diognostic_get_appointment_state.dart';


class DiagnosticAppointmentListCubit extends Cubit<DiagnosticAppointmentListState> {
  final DiagnosticAppointmentListRepo diagnosticAppointmentListRepo;

  DiagnosticAppointmentListCubit( this.diagnosticAppointmentListRepo)
      : super(const DiagnosticAppointmentListInitial());

  Future<void> fetchAppointmentList() async {
    emit(const DiagnosticAppointmentListLoading());
    try {
      final res = await diagnosticAppointmentListRepo.getAppointmnetsApi();
      if (res != null) {
        emit(DiagnosticAppointmentListLoaded(res));
      } else {
        emit(const DiagnosticAppointmentListError('No appointment data received'));
      }
    } catch (e) {
      emit(DiagnosticAppointmentListError('Failed to fetch appointments: $e'));
    }
  }
}