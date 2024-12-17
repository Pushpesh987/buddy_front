import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api_service/file_service.dart';
import '../shared/shared.dart';

final fileUploadServiceProvider = Provider<FileUploadService>((ref) {
  final shared = ref.read(sharedProvider);

  return FileUploadService(shared: shared);
});

final sharedProvider = Provider<Shared>((ref) {
  return Shared(secureStorage: const FlutterSecureStorage());
});
