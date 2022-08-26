import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Details {
  static final storage = new FlutterSecureStorage();

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
}
