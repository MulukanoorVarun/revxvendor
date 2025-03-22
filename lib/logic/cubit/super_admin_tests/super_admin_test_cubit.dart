import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revxvendor/logic/cubit/super_admin_tests/super_admin_test_state.dart';
import 'package:revxvendor/logic/cubit/super_admin_tests/super_admin_tests_repository.dart';

class SuperAdminTestsCubit extends Cubit<SuperAdminTestsState>{
  SuperAdminTestRepository superAdminTestRepository;
  SuperAdminTestsCubit(this.superAdminTestRepository) : super(SuperAdminTestsInitially());

  Future<void> getSuperaAdminTests() async {
    final res = await superAdminTestRepository.getSuperAdminTests();
    emit(SuperAdminTestsLoading());
    try {
      if (res != null) {
        emit(SuperAdminTestsLoaded(res));
      }else{
        emit(SuperAdminTestsError(res?.settings?.message??''));
      }
    } catch (e) {
      emit(SuperAdminTestsError("Error loading super admin tests"));
    }
  }
}