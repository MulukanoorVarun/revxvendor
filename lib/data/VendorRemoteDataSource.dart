import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:revxvendor/Models/SuccessModel.dart';
import 'package:revxvendor/Models/SuperAdminTestsModel.dart';
import 'package:revxvendor/Services/ApiClient.dart';
import '../Models/AppointmentDetailsModel.dart';
import '../Models/AppointmentListModel.dart';
import '../Models/DiognosticGetCategoriesModel.dart';
import '../Models/LoginModel.dart';
import '../Models/VendorGetTestDetailsModel.dart';
import '../Models/VendorGetTestsModel.dart';
import '../components/debugPrint.dart';
import 'api_routes.dart';

abstract class VendorRemoteDataSource {
  Future<LoginModel?> loginApi(Map<String, dynamic> data);
  Future<SuccessModel?> postDiognosticRegister(FormData registerData);
  Future<VendorGetTestsModel?> DiagnosticgetTests(page);
  Future<SuccessModel?> DiagnosticDelateTest(String id);
  Future<SuccessModel?> addTestApi(List<String> testIds);
  Future<DiognosticGetCategoriesModel?> DiognosticGetCategorys();
  Future<SuperAdminTestsModel?> getSuperAdminTestsApi();
  Future<VendorGetTestDetailsModel?> getVendorTestDetailsApi(id);
  Future<AppointmentListModel?> getAppointmnetListApi();
}

class VendorRemoteDataSourceImpl implements VendorRemoteDataSource {

  @override
  Future<SuccessModel?> addTestApi(List<String> testIds) async {
    try {
      FormData formData = FormData.fromMap({
        "tests": testIds,  // Ensures the list is passed correctly
      });

      Response response = await ApiClient.post("${RemoteUrls.addTests}", data: formData);

      if (response.statusCode == 200) {
        debugPrint('addTestApi Response: ${response.data}');
        return SuccessModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      debugPrint('Error in addTestApi: $e');
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

  Future<VendorGetTestsModel?> DiagnosticgetTests(page) async {
    try {
      Response response = await ApiClient.get('${RemoteUrls.vendorGetTests}?page=${page}');
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

  @override
  Future<VendorGetTestDetailsModel?> getVendorTestDetailsApi(id)async{
    try{
      Response response = await ApiClient.get( '${RemoteUrls.vendorGetTestsDetails}/${id}',);
      if(response.statusCode==200){
        LogHelper.printLog('getVendorTestDetailsApi', response.data);
        return VendorGetTestDetailsModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Error getVendorTestDetailsApi data: $e");
      return null;
    }
    }


  Future<AppointmentListModel?> getAppointmnetListApi()async{
    try{
      Response response =await ApiClient.get('${RemoteUrls.vendorGetAppointment}');
      if(response.statusCode==200){
        LogHelper.printLog('getAppointmnetListApi', response.data);
        return AppointmentListModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print("Error getAppointmnetListApi data: $e");
      return null;
    }
  }
}
