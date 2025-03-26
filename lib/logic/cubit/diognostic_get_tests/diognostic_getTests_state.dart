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
class DiagnosticTestsLoadingMore extends DiagnosticTestsState {
  final List<VendorGetTest> tests;
  final bool hasNextPage;
  DiagnosticTestsLoadingMore(this.tests,this.hasNextPage);

  @override
  List<Object?> get props => [tests];
}

// List Loaded State
class DiagnosticTestListLoaded extends DiagnosticTestsState {
  final List<VendorGetTest> tests;
  final bool hasNextPage; // Tracks if more data is available
  DiagnosticTestListLoaded(this.tests,this.hasNextPage);

  @override
  List<Object?> get props => [tests];
}

// class DiagnosticTestsLoadingMore extends DiagnosticTestsState {
//   final List<VendorGetTest> tests;
//   final bool hasNextPage;
//   DiagnosticTestListLoadedMore(this.tests,this.hasNextPage);
//
//   @override
//   List<Object?> get props => [testModel];
// }

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
