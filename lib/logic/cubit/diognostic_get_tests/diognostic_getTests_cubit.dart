import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revxvendor/Models/VendorGetTestsModel.dart';
import 'diognostic_getTests_repository.dart';
import 'diognostic_getTests_state.dart';

class DiagnosticTestsCubit extends Cubit<DiagnosticTestsState> {
  final DiagnosticTestsRepository repository;
  List<VendorGetTest> _currentTestsList = [];
  int _currentPage = 1;
  bool _hasNextPage = true;
  bool _isLoadingMore = false;


  DiagnosticTestsCubit(this.repository) : super(DiagnosticTestsInitially());

  Future<void> getTests() async {
    emit(DiagnosticTestsLoading());
    _currentPage=1;
    try {
      final res = await repository.VendorgetTest(_currentPage);
      if (res != null && res.data != null && res.data is List) { // ✅ Ensure data is a list
        _currentTestsList = (res.data as List).cast<VendorGetTest>();
        _hasNextPage=res.settings?.nextPage??false;
        emit(DiagnosticTestListLoaded(_currentTestsList,_hasNextPage)); // ✅ Emit correct state
      } else {
        emit(DiagnosticTestsError("No tests found"));
      }
    } catch (e) {
      emit(DiagnosticTestsError("Error fetching tests: $e"));
    }
  }

  Future<void> getMoreTests() async {
    if (_isLoadingMore || !_hasNextPage) return;
    _isLoadingMore = true;
    emit(DiagnosticTestsLoadingMore(_currentTestsList,_hasNextPage));
    try {
      final res = await repository.VendorgetTest(_currentPage + 1); // Increment page here
      if (res != null && res.data != null && res.data is List) {
        final newTests = (res.data as List).cast<VendorGetTest>();
        _currentTestsList.addAll(newTests);
        _currentPage++;
        _hasNextPage = res.settings?.nextPage ?? false;
        _isLoadingMore = false;
        emit(DiagnosticTestListLoaded(List.from(_currentTestsList), _hasNextPage));
      } else {
        _isLoadingMore = false;
        emit(DiagnosticTestsError("No tests found"));
      }
    } catch (e) {
      _isLoadingMore = false;
      emit(DiagnosticTestsError("Error fetching tests: $e"));
    }
  }

  Future<void> addTests(List<String> testIds) async {
    emit(DiagnosticTestsLoading());
    try {
      final res = await repository.addTest(testIds);
      if (res != null) {
        emit(DiagnosticTestsLoaded(res));
        getTests();
      } else {
        emit(DiagnosticTestsError("Failed to add test"));
      }
    } catch (e) {
      emit(DiagnosticTestsError("Error: $e"));
    }
  }

  Future<void> deleteTest(String id) async {
    emit(DiagnosticTestsLoading());
    try {
      final res = await repository.VendordelateTest(id);
      if (res != null) {
        emit(DiagnosticTestsLoading());
        _currentTestsList.removeWhere((test) => test.id == id);
        emit(DiagnosticTestListLoaded(List.from(_currentTestsList),_hasNextPage));
      } else {
        emit(DiagnosticTestsError("Failed to delete test"));
      }
    } catch (e) {
      emit(DiagnosticTestsError("Error: $e"));
    }
  }
}


