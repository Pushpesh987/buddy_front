import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/shared/shared.dart';
import '../models/auth_model.dart';
import '../repositories/auth_repository.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final AuthStatus status;
  final AuthModel? authModel;
  final String? errorMessage;

  AuthState({
    this.status = AuthStatus.initial,
    this.authModel,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthModel? authModel,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      authModel: authModel ?? this.authModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final Shared shared;

  AuthViewModel({
    required this.authRepository,
    required this.shared,
  }) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading);

    final response = await authRepository.login(email, password);

    response.fold(
      (error) {
        state = state.copyWith(
          status: AuthStatus.failure,
          errorMessage: error,
        );
      },
      (authModel) {
        state = state.copyWith(
          status: AuthStatus.success,
          authModel: authModel,
        );
      },
    );
  }

//   Future<void> getUserIdFromToken() async {
//     final token = await shared.getAuthToken();
//     if (token != null) {
//       final userId = shared.decryptToken(token);
//       if (userId != null) {
//         // Save userId globally (you could set it in a global provider or in the state)
//         // For now, let's print it to confirm it's decrypted
//         print("User ID: $userId");
//       }
//     }
//   }
}
