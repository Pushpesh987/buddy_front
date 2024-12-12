import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class Shared {
  final FlutterSecureStorage secureStorage;

  Shared({required this.secureStorage});

  Future<String?> getAuthToken() async {
    return await secureStorage.read(key: 'auth_token');
  }

  Future<void> saveAuthToken(String token) async {
    await secureStorage.write(key: 'auth_token', value: token);
  }

  Future<void> deleteAuthToken() async {
    await secureStorage.delete(key: 'auth_token');
  }

  String? decryptToken(String token) {
    try {
      final payload = Jwt.parseJwt(token);
      return payload['user_id'];
    } catch (e) {
      return null;
    }
  }
}
