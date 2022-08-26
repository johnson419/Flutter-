// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:instagram_clone/register_api.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var regmailController = TextEditingController();
  var regpasswordController = TextEditingController();

  var email;
  var password;
  var confpassword;
  bool _obscuretext = true;
  
  

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(479, 915),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
       
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              title: Text(
            'Register page',
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
            ),
          )),
          body: Center(
            child: Card(
              elevation: 20,
              shadowColor: Colors.black,
              color: Colors.blue[50],
              child: Container(
                margin: EdgeInsets.fromLTRB(20.sp, 10.sp, 20.sp, 40.sp),
                height: 600.h,
                width: 420.w,
                alignment: Alignment.center,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 50.sp),
                      alignment: Alignment.bottomCenter,
                      height: 30.h,
                      width: 285.h,
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.h,
                        width: 285.w,
                        child: Text(
                          'REGISTRATION FORM',
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 500.h,
                      width: 323.w,
                      margin: EdgeInsets.fromLTRB(25.sp, 0.sp, 25.sp, 50.sp),
                      child: ListView(
                        children: [
                          Container(
                            height: 48.h,
                            width: 285.w,
                            margin:
                                EdgeInsets.fromLTRB(8.sp, 20.sp, 8.sp, 40.sp),
                            child: TextField(
                              controller: regmailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Your email address',
                                suffixIcon: Icon(Icons.email),
                              ),
                              onChanged: (email) {
                                setState(() {
                                  this.email = email;
                                });
                              },
                            ),
                          ), // first text field
                          Container(
                            margin:
                                EdgeInsets.fromLTRB(8.sp, 20.sp, 8.sp, 40.sp),
                            height: 48.h,
                            width: 285.w,
                            child: TextField(
                              obscureText: _obscuretext,
                              controller: regpasswordController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'enter your password',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscuretext = !_obscuretext;
                                    });
                                  },
                                  icon: Icon(
                                    _obscuretext
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              onChanged: (password) {
                                setState(() {
                                  this.password = password;
                                });
                              },
                            ),
                          ), // second text field

                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.sp, style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp)),
                            ),
                            height: 50.h,
                            width: 100.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(
                                113.sp, 10.sp, 113.sp, 84.sp),
                            child: TextButton.icon(
                              onPressed: (() {
                                regUser(regmailController.text,
                                    regpasswordController.text, context);
                              }),
                              icon: Icon(
                                Icons.person_add,
                                size: 30.sp,
                                semanticLabel: 'signup',
                              ),
                              label: Text(
                                'Signup',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ), //contains register button
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
