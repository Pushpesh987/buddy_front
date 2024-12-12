import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/api_service/api_service.dart';
import '../../../core/shared/shared.dart';
import '../repositories/auth_repository.dart';
import '../viewmodel/auth_view_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final sharedProvider = Provider<Shared>((ref) {
  return Shared(secureStorage: const FlutterSecureStorage());
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final shared = ref.watch(sharedProvider);
  return AuthRepository(apiService: apiService, shared: shared);
});

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  final authRepo = ref.read(authRepositoryProvider);
  final shared = ref.read(sharedProvider);
  return AuthViewModel(authRepository: authRepo, shared: shared);
});
