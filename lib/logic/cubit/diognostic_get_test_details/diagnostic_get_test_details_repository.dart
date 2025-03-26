import 'package:revxvendor/data/VendorRemoteDataSource.dart';

import '../../../Models/VendorGetTestDetailsModel.dart';

abstract class DiagnosticTestDetailsRepository {
  Future<VendorGetTestDetailsModel?> getTestDetails(id);
}

class DiagnosticTestDetailsImp extends DiagnosticTestDetailsRepository {
  VendorRemoteDataSource vendorRemoteDataSource;
  DiagnosticTestDetailsImp({required this.vendorRemoteDataSource});

  Future<VendorGetTestDetailsModel?> getTestDetails(id) async {
    return await vendorRemoteDataSource.getVendorTestDetailsApi(id);
  }
}
