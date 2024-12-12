import 'package:buddy_front/bottom_navigation.dart';
import 'package:buddy_front/core/theme/theme.dart';
import 'package:buddy_front/features/auth/view/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helpers/failure.dart';
import '../../../../core/helpers/hide_keyboard.dart';
import '../../../../core/helpers/success_snackbar.dart';
import '../../providers/auth_providers.dart';
import '../../viewmodel/auth_view_model.dart';
import 'signup_page.dart';
import '../widgets/app_custom_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
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
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _validateAndLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      final authViewModel = ref.read(authViewModelProvider.notifier);
      await authViewModel.login(
        emailController.text.trim(),
        passwordController.text,
      );

      if (!mounted) return;

      final state = ref.read(authViewModelProvider);
      if (state.status == AuthStatus.success) {
        showSuccess(context, 'Login Successfull!!!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigation(),
          ),
        );
      } else if (state.status == AuthStatus.failure) {
        showError(context, 'Login failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

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
                      const SizedBox(height: 100),
                      Image.asset(
                        'assets/animations/login.gif',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Login",
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
                        if (authState.status == AuthStatus.loading) const CircularProgressIndicator(),
                        if (authState.status != AuthStatus.loading)
                          AuthButton(
                            buttonText: 'Login',
                            onTap: _validateAndLogin,
                          ),
                        const SizedBox(height: 25),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const SignupPage(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Don\'t have an account? ',
                              style: AppTheme.bodyLargeStyle.copyWith(
                                color: AppTheme.lightThemeMode.colorScheme.onSurface,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign Up',
                                  style: AppTheme.bodyLargeStyle.copyWith(
                                    color: AppTheme.lightThemeMode.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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
