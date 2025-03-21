import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Utils/NoInternet.dart';
import '../Utils/Preferances.dart';
import '../logic/bloc/internet_status/internet_status_bloc.dart';
import 'LogInWithEmail.dart';
import 'VendorDashBoard.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String token = "";
  // String status = "";

  @override
  void initState() {
    super.initState();

    fetchDetails();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String Token = '';

  String role="";

  void fetchDetails() async {
    var token = await PreferenceService().getString('access_token');
    setState(() {
      Token = token ?? '';
    });
    _navigateToNextScreen();
  }

  // Future<void> _checkPermissions() async {
  //   DeviceInfoPlugin plugin = DeviceInfoPlugin();
  //   AndroidDeviceInfo android = await plugin.androidInfo;
  //   Map<Permission, PermissionStatus> statuses = {
  //     Permission.location: await Permission.location.status,
  //     Permission.camera: await Permission.camera.status,
  //     Permission.notification: await Permission.notification.status,
  //   };
  //
  //   if (android.version.sdkInt < 33) {
  //
  //     statuses[Permission.storage] =
  //     await Permission.storage.status; // For Android 12 and below
  //   } else {
  //     statuses[Permission.photos] =
  //     await Permission.photos.status; // For Android 13+
  //   }
  //
  //   bool allPermissionsGranted = statuses.values.every((status) => status.isGranted);
  //
  //   setState(() {
  //     permissions_granted = allPermissionsGranted;
  //     print("permissions_granted:${permissions_granted}");
  //   });
  //     _navigateToNextScreen();
  // }

  void _navigateToNextScreen() {
    Future.microtask(() {
      if(Token==''){
        context.pushReplacement('/login');
      }else{
        context.pushReplacement('/vendor_dashboard');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<InternetStatusBloc, InternetStatusState>(
        listener: (context, state) {
            if (state is InternetStatusLostState) {
            Future.microtask(() {
           context.push(('/no_internet'));
            });
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              height: screenheight,
              child: Center(
                child: Image.asset(
                  "assets/REVX_LOGO.png",
                  width: 260,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}