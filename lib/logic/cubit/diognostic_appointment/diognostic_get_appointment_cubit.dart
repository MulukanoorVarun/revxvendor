import 'package:flutter_bloc/flutter_bloc.dart';

import 'diognostic_get_appointment_repository.dart';
import 'diognostic_get_appointment_state.dart';


class DiagnosticAppointmentListCubit extends Cubit<DiagnosticAppointmentListState> {
  final DiagnosticAppointmentListRepo diagnosticAppointmentListRepo;

  DiagnosticAppointmentListCubit( this.diagnosticAppointmentListRepo)
      : super(const DiagnosticAppointmentListInitial());

  Future<void> fetchAppointmentList(String? status) async {
    emit(const DiagnosticAppointmentListLoading());
    try {
      final res = await diagnosticAppointmentListRepo.getAppointmnetsApi(status);
      if (res != null) {
        emit(DiagnosticAppointmentListLoaded(res));
      } else {
        emit(const DiagnosticAppointmentListError('No appointment data received'));
      }
    } catch (e) {
      emit(DiagnosticAppointmentListError('Failed to fetch appointments: $e'));
    }
  }

  Future<void> deleteAppointment(String id) async {
    emit(const DiagnosticAppointmentListLoading());
    try {
      final res = await diagnosticAppointmentListRepo.deleteAppointment(id);
      if (res != null) {

        emit(DiagnosticAppointmentSuccess(res));
        await fetchAppointmentList('booked');
      } else {
        emit(const DiagnosticAppointmentListError('No appointment data deleted'));
      }
    } catch (e) {
      emit(DiagnosticAppointmentListError('Failed to delete appointment: $e'));
    }
  }
  Future<void> updateStatusOfAppointment(String id,String status) async {
    emit(const DiagnosticAppointmentListLoading());
    try {
      final res = await diagnosticAppointmentListRepo.UpdateStatusOfAppointment(id, status);
      if (res != null) {

        emit(DiagnosticAppointmentSuccess(res));
        await fetchAppointmentList('booked');
      } else {
        emit(const DiagnosticAppointmentListError('Failed to update appointment status'));
      }
    } catch (e) {
      emit(DiagnosticAppointmentListError('Failed to update appointment status: $e'));
    }
  }
}