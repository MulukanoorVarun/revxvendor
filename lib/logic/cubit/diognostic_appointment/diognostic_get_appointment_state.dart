import 'package:equatable/equatable.dart';
import '../../../Models/AppointmentDetailsModel.dart';
import '../../../Models/AppointmentListModel.dart';

abstract class DiagnosticAppointmentListState extends Equatable {
  const DiagnosticAppointmentListState();

  @override
  List<Object?> get props => [];
}

class DiagnosticAppointmentListInitial extends DiagnosticAppointmentListState {
  const DiagnosticAppointmentListInitial();
}

class DiagnosticAppointmentListLoading extends DiagnosticAppointmentListState {
  const DiagnosticAppointmentListLoading();
}

class DiagnosticAppointmentListLoaded extends DiagnosticAppointmentListState {
  final AppointmentListModel appointmentListModel;

  const DiagnosticAppointmentListLoaded(this.appointmentListModel);

  @override
  List<Object?> get props => [appointmentListModel];
}

class DiagnosticAppointmentListError extends DiagnosticAppointmentListState {
  final String errorMessage;

  const DiagnosticAppointmentListError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}