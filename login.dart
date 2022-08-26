// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/register.dart';
import 'api.dart';

void main(List<String> args) {
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  dynamic username = '';
  var email;
  var password;
  bool _obscuretext = true;
  

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(479, 915),
      splitScreenMode: true,
      builder:(context, child) =>  Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 30.sp,
              ),
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.fromLTRB(10.sp, 60.sp, 10.sp, 10.sp),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10.sp, 20.sp, 10.sp, 10.sp),
                child: Text(
                  'Hello there',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding:  EdgeInsets.fromLTRB(10.sp, 10.sp, 10.sp, 20.sp),
                child: Text(
                  'Login into your account',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
    
              Container(
                padding:  EdgeInsets.fromLTRB(10.sp, 25.sp, 10.sp, 15.sp),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter your e-mail',
                    suffixIcon: Icon(Icons.email),
                  ),
                  onChanged: (email) {
                    setState(() {
                      this.email = email;
                    });
                  },
                ),
              ),
              Container(
                padding:  EdgeInsets.fromLTRB(10.sp, 25.sp, 10.sp, 15.sp),
                child: TextField(
                  obscureText: _obscuretext,
                  controller: passwordController,
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
                        )),
                  ),
                  onChanged: (password) {
                    setState(() {
                      this.password = password;
                    });
                  },
                ),
              ),
    
              Container(
                height: 60.h,
                width: 100.w,
                padding: EdgeInsets.fromLTRB(120.sp, 20.sp, 120.sp, 0.sp),
                child: ElevatedButton(
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(),
                  ),
                  onPressed: () {
                    login(emailController.text, passwordController.text, context);
                  }, //login button
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      height: 1.5,
                      textStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding:  EdgeInsets.fromLTRB(10.sp, 50.sp, 10.sp, 20.sp),
                child: Text('Don\'t have an account?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                      ),
                    )),
              ), //text container
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  height: 50.h,
                  width: 100.w,
                  padding: EdgeInsets.fromLTRB(80.sp, 20.sp, 80.sp, 0.sp),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white60, backgroundColor: Colors.white60,
                    ),
                    child: Text(
                      'SIGN UP',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
