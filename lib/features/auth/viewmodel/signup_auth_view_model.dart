import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/signup_auth_repository.dart';

enum SignupStatus { initial, loading, success, failure }

class SignupState {
  final SignupStatus status;
  final String? errorMessage;

  SignupState({
    this.status = SignupStatus.initial,
    this.errorMessage,
  });

  SignupState copyWith({
    SignupStatus? status,
    String? errorMessage,
  }) {
    return SignupState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class SignupAuthViewModel extends StateNotifier<SignupState> {
  final SignupAuthRepository signupAuthRepository;

  SignupAuthViewModel({
    required this.signupAuthRepository,
  }) : super(SignupState());

  Future<void> signup(String username, String email, String password) async {
    state = state.copyWith(status: SignupStatus.loading);

    final response = await signupAuthRepository.signup(username, email, password);

    response.fold(
      (error) {
        state = state.copyWith(
          status: SignupStatus.failure,
          errorMessage: error,
        );
      },
      (successMessage) {
        state = state.copyWith(
          status: SignupStatus.success,
        );
      },
    );
  }
}
