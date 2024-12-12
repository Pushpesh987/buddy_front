import 'package:fpdart/fpdart.dart';

import '../../../core/api_service/api_service.dart';
import '../../../core/shared/shared.dart';
import '../models/auth_model.dart';

class AuthRepository {
  final ApiService apiService;
  final Shared shared;

  AuthRepository({
    required this.apiService,
    required this.shared,
  });

  Future<Either<String, AuthModel>> login(String email, String password) async {
    final response = await apiService.request(
      HttpMethod.post,
      '/api/v1/auth/signin',
      data: {'email': email, 'password': password},
    );

    return response.fold(
      (l) => left(l),
      (r) {
        if (r.containsKey('data')) {
          final authModel = AuthModel.fromJson(r['data']);

          shared.saveAuthToken(authModel.token);
          return right(authModel);
        } else {
          return left('Invalid login credentials');
        }
      },
    );
  }
}
