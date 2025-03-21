import 'package:dio/dio.dart';

import '../../../Models/SuccessModel.dart';
import '../../../data/VendorRemoteDataSource.dart';

abstract class VendorRegisterRepository {
  Future<SuccessModel?> postDiognosticRegister(FormData registerData);
}

class VendorRegisterImpl extends VendorRegisterRepository {
  VendorRemoteDataSource remoteDataSource;
  VendorRegisterImpl({required this.remoteDataSource});

  @override
  Future<SuccessModel?> postDiognosticRegister(FormData registerData) async {
    return await remoteDataSource.postDiognosticRegister(registerData);
  }
}
