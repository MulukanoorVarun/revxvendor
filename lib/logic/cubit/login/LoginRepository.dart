import '../../../Models/LoginModel.dart';
import '../../../data/VendorRemoteDataSource.dart';

abstract class LoginRepository {
  Future<LoginModel?> postLogin( Map<String,dynamic> data);
}

class LoginImpl implements LoginRepository {
  VendorRemoteDataSource remoteDataSource;
  LoginImpl({required this.remoteDataSource});

  @override
  Future<LoginModel?> postLogin( Map<String,dynamic> data) async {
    return await remoteDataSource.loginApi(data);
  }
}
