
import 'package:revxvendor/Models/SuperAdminTestsModel.dart';
import 'package:revxvendor/data/VendorRemoteDataSource.dart';

abstract class SuperAdminTestRepository{
  Future<SuperAdminTestsModel?> getSuperAdminTests();
}

class SuperAdminTestRepositoryImpl implements SuperAdminTestRepository{
  VendorRemoteDataSource vendorRemoteDataSource;
  SuperAdminTestRepositoryImpl({required this.vendorRemoteDataSource});

  @override
  Future<SuperAdminTestsModel?> getSuperAdminTests() async {
    return await vendorRemoteDataSource.getSuperAdminTestsApi();
  }
}