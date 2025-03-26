import 'dart:io';
import 'package:flutter/cupertino.dart';
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
import 'package:revxvendor/presentation/Test/TestDetails.dart';
import 'package:revxvendor/presentation/Test/VendorTest.dart';
import 'package:revxvendor/presentation/VendorDashBoard.dart';
import 'package:revxvendor/presentation/VendorRegisterScreen.dart';

import 'Utils/NoInternet.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder:
          (context, state) => buildSlideTransitionPage(Splash(), state),
    ),
    GoRoute(
      path: '/login',
      pageBuilder:
          (context, state) => buildSlideTransitionPage(LogInWithEmail(), state),
    ),
    GoRoute(
      path: '/vendor_dashboard',
      pageBuilder:
          (context, state) =>
              buildSlideTransitionPage(VendorDashboard(), state),
    ),
    GoRoute(
      path: '/appointments',
      pageBuilder:
          (context, state) => buildSlideTransitionPage(Appointments(), state),
    ),
    GoRoute(
      path: '/category_list',
      pageBuilder:
          (context, state) => buildSlideTransitionPage(CatagoryList(), state),
    ),
    GoRoute(
      path: '/vendor_test',
      pageBuilder:
          (context, state) => buildSlideTransitionPage(VendorTest(), state),
    ),
    GoRoute(
      path: '/patients',
      pageBuilder:
          (context, state) => buildSlideTransitionPage(Patients(), state),
    ),
    GoRoute(
      path: '/create_new_category',
      pageBuilder:
          (context, state) =>
              buildSlideTransitionPage(CreateNewCategory(), state),
    ),
    GoRoute(
      path: '/vendor_register_screen',
      pageBuilder:
          (context, state) =>
              buildSlideTransitionPage(VendorRegisterScreen(), state),
    ),
    GoRoute(
      path: '/no_internet',
      pageBuilder:
          (context, state) =>
              buildSlideTransitionPage(NoInternetWidget(), state),
    ),
    GoRoute(
      path: '/add_tests_provided',
      pageBuilder:
          (context, state) =>
              buildSlideTransitionPage(Addtestsprovided(), state),
    ),
    GoRoute(
      path: '/vendor_category',
      pageBuilder:
          (context, state) => buildSlideTransitionPage(VendorCatagory(), state),
    ),
    GoRoute(
      path: '/approval_pending',
      pageBuilder:
          (context, state) =>
              buildSlideTransitionPage(ApprovalPending(), state),
    ),
    GoRoute(
      path: '/patient_details',
      pageBuilder:
          (context, state) => buildSlideTransitionPage(PateintDetails(), state),
    ),
    GoRoute(
      path: '/test_details',
      pageBuilder: (context, state) {
        final id=state.uri.queryParameters['id']??"";
        return buildSlideTransitionPage(VendorTestDetails(id: id,), state);
      },
    ),
  ],
);

Page<dynamic> buildSlideTransitionPage(Widget child, GoRouterState state) {
  if (Platform.isIOS) {
    return CupertinoPage(key: state.pageKey, child: child);
  }
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
