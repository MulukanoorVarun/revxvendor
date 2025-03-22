import 'package:equatable/equatable.dart';
import 'package:revxvendor/Models/SuperAdminTestsModel.dart';
import '../../../Models/SuccessModel.dart';

// Base State
abstract class SuperAdminTestsState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Initial State
class SuperAdminTestsInitially extends SuperAdminTestsState {}

// Loading State
class SuperAdminTestsLoading extends SuperAdminTestsState {}

// List Loaded State
class SuperAdminTestsLoaded extends SuperAdminTestsState {
  final SuperAdminTestsModel data;
  SuperAdminTestsLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class SuperAdminTestsError extends SuperAdminTestsState {
  final String message;
  SuperAdminTestsError(this.message);

  @override
  List<Object?> get props => [message];
}
