
import 'package:revxvendor/Models/SuccessModel.dart';

import '../../../Models/AppointmentListModel.dart';
import '../../../data/VendorRemoteDataSource.dart';

abstract class DiagnosticAppointmentListRepo {
  Future<AppointmentListModel?> getAppointmnetsApi(status);
  Future<SuccessModel?> deleteAppointment(id);
  Future<SuccessModel?> UpdateStatusOfAppointment(id,status);
}

class DiagnosticAppointmentListImpl extends DiagnosticAppointmentListRepo {
  VendorRemoteDataSource vendorRemoteDataSource;
  DiagnosticAppointmentListImpl({required this.vendorRemoteDataSource});
  Future<AppointmentListModel?> getAppointmnetsApi(status) async {
    return await vendorRemoteDataSource.getAppointmnetListApi(status,);
  }

  Future<SuccessModel?> deleteAppointment(id)async{
    return await vendorRemoteDataSource.deleteAppointment(id);
  }
  Future<SuccessModel?> UpdateStatusOfAppointment(id,status)async{
    return await vendorRemoteDataSource.updateStatusAppointment(id,status);
  }
}
