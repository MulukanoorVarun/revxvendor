import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:revxvendor/Models/SuccessModel.dart';
import 'package:revxvendor/Models/SuperAdminTestsModel.dart';
import 'package:revxvendor/Services/ApiClient.dart';
import '../Models/DiognosticGetCategoriesModel.dart';
import '../Models/LoginModel.dart';
import '../Models/VendorGetTestsModel.dart';
import '../components/debugPrint.dart';
import 'api_routes.dart';

abstract class VendorRemoteDataSource {
  Future<LoginModel?> loginApi(Map<String, dynamic> data);
  Future<SuccessModel?> postDiognosticRegister(FormData registerData);
  Future<VendorGetTestsModel?> DiagnosticgetTests();
  Future<SuccessModel?> DiagnosticDelateTest(String id);
  Future<SuccessModel?> addTestApi();
  Future<DiognosticGetCategoriesModel?> DiognosticGetCategorys();
  Future<SuperAdminTestsModel?> getSuperAdminTestsApi();
}

class VendorRemoteDataSourceImpl implements VendorRemoteDataSource {

  @override
  Future<SuccessModel?> addTestApi() async {
    try {
      Response response = await ApiClient.post("${RemoteUrls.addTests}");
      if (response.statusCode == 200) {
        debugPrint('addTestApi:${response.data}',);
        return SuccessModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      debugPrint(' Error addTestApi',);
      return null;
    }
  }

  @override
  Future<SuperAdminTestsModel?> getSuperAdminTestsApi() async {
    try {
      Response response = await ApiClient.get("${RemoteUrls.superAdminTests}");
      if (response.statusCode == 200) {
        debugPrint('getSuperAdminTestsApi:${response.data}',);
        return SuperAdminTestsModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      debugPrint(' Error getSuperAdminTestsApi',);
      return null;
    }
  }

  @override
  Future<LoginModel?> loginApi(Map<String, dynamic> data) async {
    try {
      Response response = await ApiClient.post(
        "${RemoteUrls.userLogin}",
        data: data,
      );
      if (response.statusCode == 200) {
        LogHelper.printLog('loginApi:', response.data);
        return LoginModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      LogHelper.printLog('Error loginApi::', e);
      return null;
    }
  }

  Future<SuccessModel?> postDiognosticRegister(FormData registerData) async {
    try {
      Response response = await ApiClient.post(
        '${RemoteUrls.vendorRegister}',
        data: registerData,
      );
      if (response.statusCode == 200) {
        LogHelper.printLog('postDiognosticRegister', response.data);
        return SuccessModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Error postDiognosticRegister data: $e");
      return null;
    }
  }

  Future<VendorGetTestsModel?> DiagnosticgetTests() async {
    try {
      Response response = await ApiClient.get('${RemoteUrls.vendorGetTests}');
      if (response.statusCode == 200) {
        LogHelper.printLog('DiagnosticgetTests', response.data);
        return VendorGetTestsModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Error DiagnosticgetTests data: $e");
      return null;
    }
  }

  Future<SuccessModel?> DiagnosticDelateTest(String id) async {
    try {
      Response response = await ApiClient.delete(
        '${RemoteUrls.vendorDeleteTests}/${id}',
      );
      if (response.statusCode == 200) {
        LogHelper.printLog('DiagnosticDelateTest', response.data);
        return SuccessModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Error DiagnosticDelateTest data: $e");
      return null;
    }
  }

  @override
  Future<DiognosticGetCategoriesModel?> DiognosticGetCategorys() async {
    try {
      Response response = await ApiClient.get(
        '${RemoteUrls.vendorGetCategories}',
      );
      if (response.statusCode == 200) {
        LogHelper.printLog('Diognostic GetCategorys', response.data);
        return DiognosticGetCategoriesModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Error DiognosticGetCategorys data: $e");
      return null;
    }
  }
}
