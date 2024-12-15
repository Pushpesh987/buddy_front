import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state/edit_profile_form_state.dart';
import '../edit_profile_form_notifier.dart';

final editProfileFormProvider = StateNotifierProvider<EditProfileFormNotifier, EditProfileFormState>(
  (ref) => EditProfileFormNotifier(),
);
