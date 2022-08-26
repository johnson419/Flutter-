import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:instagram_clone/homepage.dart';

Future regUser(String email, String password, BuildContext context) async {
  final storage = new FlutterSecureStorage();
  var url = Uri.parse('https://reqres.in/api/register');
  var response = await post(url, body: {
    'email': email,
    'password': password,
  });
 
  if (response.statusCode == 200) {
    Map<String, dynamic> output = jsonDecode(response.body);
        await storage.write(key: 'token', value: output['token']);
    
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => const Homepage())),
          );
   
  } else {
    throw Exception("REGISTER UNSUCCSSESFUL");
  }
}





