import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/signup_auth_repository.dart';
import '../viewmodel/signup_auth_view_model.dart';
import '../../../core/api_service/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final signupAuthRepositoryProvider = Provider<SignupAuthRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return SignupAuthRepository(apiService: apiService);
});

final signupAuthViewModelProvider = StateNotifierProvider<SignupAuthViewModel, SignupState>((ref) {
  final signupAuthRepo = ref.read(signupAuthRepositoryProvider);
  return SignupAuthViewModel(signupAuthRepository: signupAuthRepo);
});
