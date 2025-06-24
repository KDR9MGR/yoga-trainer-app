import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trainer_manager_pro/core/constants/app_constants.dart';
import 'package:trainer_manager_pro/features/auth/presentation/controllers/auth_controller.dart';
import 'package:trainer_manager_pro/features/auth/presentation/widgets/custom_button.dart';
import 'package:trainer_manager_pro/features/auth/presentation/widgets/custom_text_field.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      await ref.read(authControllerProvider.notifier).signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authControllerProvider);

    // Navigate to dashboard when signed in
    ref.listen(authControllerProvider, (previous, next) {
      if (next.hasValue && next.value != null) {
        context.go(AppConstants.dashboardRoute);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              
              // App Logo and Title
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Icon(
                      Icons.fitness_center,
                      size: 60,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppConstants.appName,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Manage your fitness training business',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
              
              const Spacer(flex: 3),
              
              // Sign In Form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    CustomButton(
                      text: 'Sign In',
                      onPressed: _handleSignIn,
                      isLoading: authState.isLoading,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Google Sign In
                    CustomButton(
                      text: 'Sign in with Google',
                      onPressed: () async {
                        await ref.read(authControllerProvider.notifier).signInWithGoogle();
                      },
                      backgroundColor: Colors.white,
                      textColor: Colors.black87,
                      borderColor: Colors.grey.shade300,
                      icon: const Icon(Icons.g_mobiledata, size: 24),
                    ),
                  ],
                ),
              ),
              
              const Spacer(flex: 2),
              
              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(AppConstants.signupRoute);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
              
              // Error Display
              if (authState.hasError)
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
              color: theme.colorScheme.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.colorScheme.error.withValues(alpha: 0.3)),
            ),
                  child: Text(
                    authState.error.toString(),
                    style: TextStyle(color: theme.colorScheme.error),
                    textAlign: TextAlign.center,
                  ),
                ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
} 