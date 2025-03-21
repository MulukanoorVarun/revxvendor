

import '../../../Models/DiognosticGetCategoriesModel.dart';
import '../../../data/VendorRemoteDataSource.dart';

abstract class DiognosticGetCategoryRepository{
  Future<DiognosticGetCategoriesModel?> GetDiognosticCategorys();

}
class DiognosticGetCategoryImpl extends DiognosticGetCategoryRepository{
   final VendorRemoteDataSource vendorRemoteDataSource;

   DiognosticGetCategoryImpl({required this.vendorRemoteDataSource});

   Future<DiognosticGetCategoriesModel?> GetDiognosticCategorys() async{
    return await  vendorRemoteDataSource.DiognosticGetCategorys();
   }

}