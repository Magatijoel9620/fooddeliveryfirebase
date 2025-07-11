// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/components/my_button.dart';
import 'package:food_delivery_firebase/components/my_textfield.dart';
import '../services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // For form validation

  bool _isLoading = false; // To show a loading indicator

  void register() async {
    if (_formKey.currentState!.validate()) { // Validate the form
      setState(() {
        _isLoading = true;
      });

      // Check if passwords match (already part of validator, but good for explicit check if needed)
      if (passwordController.text != confirmPasswordController.text) {
        // This specific check is handled by the validator, but if you had other
        // pre-submission logic, it could go here.
        // For this case, the validator on confirmPasswordController should catch it.
        // If not caught by validator, you could show a dialog here:
        // showDialog( /* ... */);
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
        return; // Stop execution if passwords don't match (though validator should prevent this)
      }

      final authService = AuthService();
      try {
        await authService.signUpWithEmailPassword(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        // Navigation will be handled by AuthGate/AuthWrapper
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text("Registration Failed"),
            content: Text(e.toString().replaceFirst("Exception: ", "")), // Clean error
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo and Welcome Message
                  Column(
                    children: [
                      Icon(
                        Icons.person_add_alt_1_rounded, // Icon for registration
                        size: 80,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Create Your Account",
                        style: textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Join us and start your delicious journey!",
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
                  MyTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    obscureText: false,
                    prefixIcon: Icons.email_outlined,
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
                    hintText: "Create a password",
                    obscureText: true,
                    prefixIcon: Icons.lock_outline_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please create a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      // Optionally, trigger revalidation of confirm password field when this changes
                      // if (_formKey.currentState != null && confirmPasswordController.text.isNotEmpty) {
                      //   _formKey.currentState!.validate();
                      // }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password TextField
                  Text("Confirm Password", style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 8),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm your password",
                    obscureText: true,
                    prefixIcon: Icons.lock_clock_outlined, // Different icon for confirm
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32), // More space before button

                  // Sign Up Button
                  MyButton(
                    text: "Sign Up",
                    onTap: _isLoading ? null : register,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 24),

                  // Already a member? Login now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: colorScheme.onSurfaceVariant),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Login now",
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
