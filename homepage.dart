// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/home.dart';
import 'package:instagram_clone/profile.dart';

import 'login.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  List<dynamic> pages = [
    const Home(),
    const Profile(),
  ];
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(479, 915),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                margin:  EdgeInsets.fromLTRB(0.sp, 13.sp, 2.sp, 0.sp),
                child: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              IconButton(
                tooltip: 'logout',
                alignment: Alignment.centerRight,
                onPressed: () async {
                  await storage.delete(key: 'token');
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: ((context) => const LoginPage())), (route) => false);
                },
                icon: Icon(
                  Icons.logout,
                  size: 30.sp,
                  semanticLabel: 'Logout',
                ),
              ),
            ],
          ),
          body: pages.elementAt(selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30.sp,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 30.sp,
                  ),
                  label: 'Profile'),
            ],
            unselectedLabelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            selectedLabelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            currentIndex: selectedIndex,
            selectedItemColor: Colors.blue[600],
            onTap: ((value) {
              setState(() {
                selectedIndex = value;
              });
            }),
          ),
        ),
      ),
    );
  }
}
