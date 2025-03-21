import 'package:flutter_bloc/flutter_bloc.dart';

import 'diognostic_getTests_repository.dart';
import 'diognostic_getTests_state.dart';

class DiagnosticTestsCubit extends Cubit<DiagnosticTestsState> {
  DiagnosticTestsRepository diagnosticGetTestsRepositors;
  DiagnosticTestsCubit(this.diagnosticGetTestsRepositors) : super(DiagnosticTestsInitially());

  Future<void> getTests() async {
    final res = await diagnosticGetTestsRepositors.VendorgetTest();
    emit(DiagnosticTestsLoading());
    try {
      if (res != null) {
        emit(DiagnosticTestListLoaded(res));
      }else{
        emit(DiagnosticTestsError(res?.settings?.message??''));
      }
    } catch (e) {
      emit(DiagnosticTestsError(res?.settings?.message??''));
    }
  }

  Future<void> delateTests(id)async{
    final res= await diagnosticGetTestsRepositors.VendordelateTest(id);
    emit(DiagnosticTestsLoading());
    try{
      if(res!=null){
        emit(DiagnosticTestsLoaded(res));
      }else{
        emit(DiagnosticTestsError(res?.settings?.message??""));
      }
    }catch(e){
      emit(DiagnosticTestsError(res?.settings?.message??''));
    }
  }
}
