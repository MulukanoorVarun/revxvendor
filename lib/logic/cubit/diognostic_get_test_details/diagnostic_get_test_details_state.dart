import 'package:equatable/equatable.dart';

import '../../../Models/VendorGetTestDetailsModel.dart';

abstract class DiagnosticTestDetailsState {


}

class DiagnosticTestDetailsIntailly extends DiagnosticTestDetailsState{}
class DiagnosticTestDetailsLoading extends DiagnosticTestDetailsState{}
class DiagnosticTestDetailsLoaded extends DiagnosticTestDetailsState{
final VendorGetTestDetailsModel vendorGetTestDetailsModel;
DiagnosticTestDetailsLoaded(this.vendorGetTestDetailsModel);
}
class DiagnosticTestDetailsError extends DiagnosticTestDetailsState{
  String msg;
  DiagnosticTestDetailsError(this.msg);

}