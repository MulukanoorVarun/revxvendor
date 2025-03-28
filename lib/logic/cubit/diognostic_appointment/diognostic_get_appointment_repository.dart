
import '../../../Models/AppointmentListModel.dart';
import '../../../data/VendorRemoteDataSource.dart';

abstract class DiagnosticAppointmentListRepo {
  Future<AppointmentListModel?> getAppointmnetsApi();
}

class DiagnosticAppointmentListImpl extends DiagnosticAppointmentListRepo {
  VendorRemoteDataSource vendorRemoteDataSource;
  DiagnosticAppointmentListImpl({required this.vendorRemoteDataSource});
  Future<AppointmentListModel?> getAppointmnetsApi() async {
    return await vendorRemoteDataSource.getAppointmnetListApi();
  }
}
