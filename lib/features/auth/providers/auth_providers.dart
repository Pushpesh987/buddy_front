import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/service_provider.dart/service_provider.dart';
import '../repositories/auth_repository.dart';
import '../viewmodel/auth_view_model.dart';

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
