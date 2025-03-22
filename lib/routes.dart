import 'package:go_router/go_router.dart';
import 'package:revxvendor/presentation/Appointment.dart';
import 'package:revxvendor/presentation/ApprovalPending.dart';
import 'package:revxvendor/presentation/Catagory/CatagoryList.dart';
import 'package:revxvendor/presentation/Catagory/CreateCatagory.dart';
import 'package:revxvendor/presentation/Catagory/VendorCatagory.dart';
import 'package:revxvendor/presentation/LogInWithEmail.dart';
import 'package:revxvendor/presentation/PatientsList/PatientDetails.dart';
import 'package:revxvendor/presentation/PatientsList/Patients.dart';
import 'package:revxvendor/presentation/Splash.dart';
import 'package:revxvendor/presentation/Test/AddTestsProvided.dart';
import 'package:revxvendor/presentation/Test/VendorTest.dart';
import 'package:revxvendor/presentation/VendorDashBoard.dart';
import 'package:revxvendor/presentation/VendorRegisterScreen.dart';

import 'Utils/NoInternet.dart';

final GoRouter goRouter = GoRouter(initialLocation: '/',routes: [
  GoRoute(path: '/', builder: (context, state) => Splash()),
  GoRoute(path: '/login',builder: (context, state) => LogInWithEmail(),),
  GoRoute(path: '/vendor_dashboard',builder: (context, state) => VendorDashboard(),),
  GoRoute(path: '/appointments',builder: (context, state) => Appointments(),),
  GoRoute(path: '/category_list',builder: (context, state) => CatagoryList(),),
  GoRoute(path: '/vendor_test',builder: (context, state) => VendorTest(),),
  GoRoute(path: '/patients',builder: (context, state) => Patients(),),
  GoRoute(path: '/create_new_category',builder: (context, state) => CreateNewCategory(),),
  GoRoute(path: '/vendor_register_screen',builder: (context, state) => VendorRegisterScreen(),),
  GoRoute(path: '/no_internet',builder: (context, state) => NoInternetWidget(),),
  GoRoute(path: '/add_tests_provided',builder: (context, state) => Addtestsprovided(),),
  GoRoute(path: '/vendor_category',builder: (context, state) => VendorCatagory(),),
  GoRoute(path: '/approval_pending',builder: (context, state) => ApprovalPending(),),
  GoRoute(path: '/patient_details',builder: (context, state) => PateintDetails(),),

]);