import 'package:equatable/equatable.dart';
import 'package:revxvendor/Models/SuccessModel.dart';
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
class DiagnosticAppointmentSuccess extends DiagnosticAppointmentListState {
  final SuccessModel successModel;

  const DiagnosticAppointmentSuccess(this.successModel);

  @override
  List<Object?> get props => [successModel];
}

class DiagnosticAppointmentListError extends DiagnosticAppointmentListState {
  final String errorMessage;

  const DiagnosticAppointmentListError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}