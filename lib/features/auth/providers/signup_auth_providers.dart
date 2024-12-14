import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/service_provider.dart/service_provider.dart';
import '../repositories/signup_auth_repository.dart';
import '../viewmodel/signup_auth_view_model.dart';

final signupAuthRepositoryProvider = Provider<SignupAuthRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return SignupAuthRepository(apiService: apiService);
});

final signupAuthViewModelProvider = StateNotifierProvider<SignupAuthViewModel, SignupState>((ref) {
  final signupAuthRepo = ref.read(signupAuthRepositoryProvider);
  return SignupAuthViewModel(signupAuthRepository: signupAuthRepo);
});
