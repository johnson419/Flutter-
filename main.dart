// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/login.dart';
import 'package:instagram_clone/register.dart';
import 'package:instagram_clone/token.dart';
import 'package:page_transition/page_transition.dart';

import 'homepage.dart';

void main(List<String> args) {
  runApp(_Splash());
}

class _Splash extends StatefulWidget {
  @override
  State<_Splash> createState() => _SplashState();
}

class _SplashState extends State<_Splash> {
  late Future<String?> token;
  String? tkn;

  @override
  void initState() {
    token = Details.getToken();
    token.then((value) {
      setState(() {
        tkn = value;
      });
    });

    super.initState();
  }

  Future checker() async {}

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        // initialRoute: _initialroute,
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const Homepage(),
          '/register': (context) => const RegisterPage(),
        },
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen.withScreenFunction(
          splash: Icons.person,
          screenFunction: () async {
            if (tkn == null) {
              return const LoginPage();
            } else {
              return const Homepage();
            }
          },
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          duration: 3000,
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
