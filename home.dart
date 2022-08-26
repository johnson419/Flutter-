import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/Models/people_profiles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Userinfo>> fetchUsers() async {
    var url = Uri.https('reqres.in', '/api/users', {'page': '2'});
    var response = await get(url);
    
    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);
      Iterable data = data1['data'];

      return List<Userinfo>.from(data.map((user) {
        
        return Userinfo.fromJson(user);
      }));
    } else {
      throw Exception("THERE ARE NO USERS");
    }
  }

  Future<List<Userinfo>>? users;
  @override
  void initState() {
    users = fetchUsers();
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
          body: FutureBuilder<List<Userinfo>>(
              future: users,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Userinfo> data = snapshot.data!;
                  return Container(
                    margin: EdgeInsets.all(10.sp),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1),
                      itemCount: snapshot.data?.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: ((context, index) {
                        return Card(
                          elevation: 20,
                          color: Colors.blue[50],
                          shadowColor: Colors.black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 60.h,
                                  width: 479.w,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120.w,
                                      ),
                                      Text(
                                        data.elementAt(index).firstName,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      Text(
                                        data.elementAt(index).lastName,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  width: 350.w,
                                  height: 300.h,
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              data.elementAt(index).avatar)),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 30.h,
                                  width: 479.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        data.elementAt(index).email,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      IconButton(onPressed: (){}, icon: Icon(Icons.email_rounded, size: 30.sp,), splashColor: Colors.blue[100],),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
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
