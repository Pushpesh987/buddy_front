import 'package:fpdart/fpdart.dart';

import '../../../core/api_service/api_service.dart';

class SignupAuthRepository {
  final ApiService apiService;

  SignupAuthRepository({
    required this.apiService,
  });

  Future<Either<String, String>> signup(String username, String email, String password) async {
    final response = await apiService.request(
      HttpMethod.post,
      '/api/v1/auth/signup',
      data: {'username': username, 'email': email, 'password': password},
    );

    return response.fold(
      (error) => left(error),
      (successResponse) {
        if (successResponse['status'] == 'success') {
          final message = successResponse['message'] ?? 'Signup successful';
          return right(message);
        } else {
          return left('Signup failed. Please try again.');
        }
      },
    );
  }
}
