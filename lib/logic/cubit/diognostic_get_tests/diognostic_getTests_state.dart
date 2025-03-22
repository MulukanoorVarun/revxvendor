import 'package:equatable/equatable.dart';

import '../../../Models/SuccessModel.dart';
import '../../../Models/VendorGetTestsModel.dart';


// Base State
abstract class DiagnosticTestsState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Initial State
class DiagnosticTestsInitially extends DiagnosticTestsState {}

// Loading State
class DiagnosticTestsLoading extends DiagnosticTestsState {}

class DiagnosticTestsSaving extends DiagnosticTestsState {}

// List Loaded State
class DiagnosticTestListLoaded extends DiagnosticTestsState {
  final List<VendorGetTest> tests;
  DiagnosticTestListLoaded(this.tests)
  @override
  List<Object?> get props => [tests];
}


// Single Test Loaded State
class DiagnosticTestsLoaded extends DiagnosticTestsState {
  final SuccessModel data;
  DiagnosticTestsLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

// Error State
class DiagnosticTestsError extends DiagnosticTestsState {
  final String message;
  DiagnosticTestsError(this.message);

  @override
  List<Object?> get props => [message];
}
