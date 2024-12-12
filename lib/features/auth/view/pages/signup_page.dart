import 'package:buddy_front/core/theme/theme.dart';
import 'package:buddy_front/features/auth/view/pages/login_page.dart';
import 'package:buddy_front/features/auth/view/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helpers/failure.dart';
import '../../../../core/helpers/hide_keyboard.dart';
import '../../../../core/helpers/success_snackbar.dart';
import '../../providers/signup_auth_providers.dart';
import '../../viewmodel/signup_auth_view_model.dart';
import '../widgets/app_custom_field.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    usernameFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    usernameController.dispose();
    usernameFocusNode.dispose();
    super.dispose();
  }

  void _validateAndSignup() async {
    if (_formKey.currentState?.validate() ?? false) {
      final signupAuthViewModel = ref.read(signupAuthViewModelProvider.notifier);
      await signupAuthViewModel.signup(
        usernameController.text.trim(),
        emailController.text.trim(),
        passwordController.text,
      );

      if (!mounted) return;

      final state = ref.read(signupAuthViewModelProvider);
      if (state.status == SignupStatus.success) {
        showSuccess(context, 'Account Created Successfull!!!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } else if (state.status == SignupStatus.failure) {
        showError(context, state.errorMessage ?? 'Signup failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final signupState = ref.watch(signupAuthViewModelProvider);

    return GestureDetector(
      onTap: () => hideKeyboard(context),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      Image.asset(
                        'assets/animations/signUp.gif',
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Sign Up",
                        style: AppTheme.headlineSmallStyle.copyWith(
                          color: AppTheme.lightThemeMode.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        AuthCustomField(
                          hintText: 'Username',
                          controller: usernameController,
                          focusNode: usernameFocusNode,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Username is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        AuthCustomField(
                          hintText: 'Email',
                          controller: emailController,
                          focusNode: emailFocusNode,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email is required';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        AuthCustomField(
                          hintText: 'Password',
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          isObscuredText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        if (signupState.status == SignupStatus.loading) const CircularProgressIndicator(),
                        if (signupState.status != SignupStatus.loading)
                          AuthButton(
                            buttonText: 'Sign Up',
                            onTap: _validateAndSignup,
                          ),
                        const SizedBox(height: 25),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: AppTheme.bodyLargeStyle.copyWith(
                                color: AppTheme.lightThemeMode.colorScheme.onSurface,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: AppTheme.bodyLargeStyle.copyWith(
                                    color: AppTheme.lightThemeMode.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
