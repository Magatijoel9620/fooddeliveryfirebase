// ignore_for_file: use_build_context_synchronously

//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/components/my_button.dart';
import 'package:food_delivery_firebase/components/my_textfield.dart';
import '../services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // For form validation

  bool _isLoading = false; // To show a loading indicator on the button

  void login() async {
    if (_formKey.currentState!.validate()) { // Validate the form
      setState(() {
        _isLoading = true;
      });
      final authService = AuthService();
      try {
        await authService.signInWithEmailPassword(
          emailController.text.trim(), // Trim whitespace
          passwordController.text.trim(),
        );
        // Navigation will be handled by the AuthGate/AuthWrapper
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text("Login Failed"),
            content: Text(e.toString().replaceFirst("Exception: ", "")), // Clean up error message
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } finally {
        if (mounted) { // Check if the widget is still in the tree
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  void forgotPw() {
    // You can implement a proper forgot password screen/flow here
    // For now, a simple dialog:
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("Forgot Password"),
        content: const Text(
            "Password reset instructions would be sent to your email if this feature were fully implemented."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form( // Wrap content in a Form for validation
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo and Name
                  Column(
                    children: [
                      Icon(
                        Icons.fastfood_rounded, // Consider a more relevant app icon
                        size: 80,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Welcome Back!",
                        style: textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Sign in to continue your culinary journey",
                        textAlign: TextAlign.center,
                        style: textTheme.titleSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Email TextField
                  Text("Email", style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 8),
                  MyTextField( // Assuming MyTextField can be customized or use TextFormField directly
                    controller: emailController,
                    hintText: "you@example.com",
                    obscureText: false,
                    prefixIcon: Icons.email_outlined, // Added prefix icon
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password TextField
                  Text("Password", style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 8),
                  MyTextField(
                    controller: passwordController,
                    hintText: "Your Password",
                    obscureText: true,
                    prefixIcon: Icons.lock_outline_rounded, // Added prefix icon
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
                  const SizedBox(height: 12),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: forgotPw,
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap
                      ),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Sign In Button
                  MyButton(
                    text: "Sign In",
                    onTap: _isLoading ? null : login, // Disable button when loading
                    isLoading: _isLoading, // Pass loading state to MyButton if it supports it
                  ),
                  const SizedBox(height: 24),

                  // Not a member? Register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a Member? ",
                        style: TextStyle(color: colorScheme.onSurfaceVariant),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Register now",
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Some padding at the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
