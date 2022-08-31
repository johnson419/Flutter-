import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:instagram_clone/Models/user_profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future? user;

  Future<UserProfile> getUser() async {
    var url = Uri.https('reqres.in', '/api/users/2');
    var response = await get(url);

    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);
      var data = data1['data'];

      return UserProfile.fromJson(data);
    } else {
      throw Exception("USER NOT FOUND");
    }
  }

  Future<UserProfile>? userinfo;
  @override
  void initState() {
    userinfo = getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(479, 915),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: FutureBuilder<UserProfile>(
              future: userinfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  UserProfile data = snapshot.data!;
                  return Center(
                    child: Card(
                      elevation: 20,
                      color: Colors.blue[50],
                      shadowColor: Colors.black54,
                      child: SizedBox(
                        width: 479.w,
                        height: 600.h,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 100.h,
                              width: double.infinity,
                              child: Text(
                                'Welcome to your profile',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5.sp),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 120.w,
                                  ),
                                  Text(
                                    data.firstName,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontFamily: 'cursive',
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Text(
                                    data.lastName,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontFamily: 'cursive',
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100.w,
                              height: 300.h,
                              margin: EdgeInsets.all(20.sp),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(data.avatar)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  data.email,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async{
                                    String? encodeQueryParameters(
                                              Map<String, String> params) {
                                            return params.entries
                                                .map((MapEntry<String, String>
                                                        e) =>
                                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                .join('&');
                                          }

                                          //encodeparameters function
                                          final Uri emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path: data.email,
                                            query: encodeQueryParameters(<
                                                String, String>{
                                              'subject': 'Wanting to say hi',

                                            }),
                                          );
                                          launchUrl(emailLaunchUri);
                                  },
                                  icon: Icon(
                                    Icons.email_rounded,
                                    size: 30.sp,
                                  ),
                                  splashColor: Colors.blue[100],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
