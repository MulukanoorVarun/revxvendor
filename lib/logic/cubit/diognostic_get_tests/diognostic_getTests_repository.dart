import '../../../Models/SuccessModel.dart';
import '../../../Models/VendorGetTestsModel.dart';
import '../../../data/VendorRemoteDataSource.dart';

abstract class DiagnosticTestsRepository {
  Future<VendorGetTestsModel?> VendorgetTest();
  Future<SuccessModel?> VendordelateTest(id);
  Future<SuccessModel?> addTest(List<String> testIds);
}

class DiagnosticTestsImp implements DiagnosticTestsRepository {
  VendorRemoteDataSource vendorRemoteDataSource;
  DiagnosticTestsImp({required this.vendorRemoteDataSource});
  @override
  Future<SuccessModel?> addTest(List<String> testIds) async {
    return await vendorRemoteDataSource.addTestApi(testIds);
  }
  @override
  Future<VendorGetTestsModel?> VendorgetTest() async {
    return await vendorRemoteDataSource.DiagnosticgetTests();
  }

  @override
  Future<SuccessModel?> VendordelateTest(id) async {
    return await vendorRemoteDataSource.DiagnosticDelateTest(id);
  }
}
