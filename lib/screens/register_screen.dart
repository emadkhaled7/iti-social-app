import 'package:app/cubit/auth/auth_cubit.dart';
import 'package:app/cubit/auth/auth_state.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/widgets/auth_header.dart';
import 'package:app/widgets/auth_text_field.dart';
import 'package:app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully'),
            ),
          );

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => LoginScreen(),
            ),
            (route) => false,
          );
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(
                  title: 'Create Account',
                ),

                const SizedBox(height: 30),

                AuthTextField(
                  controller: nameController,
                  hintText: 'Name',
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 15),

                AuthTextField(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 15),

                AuthTextField(
                  controller: phoneController,
                  hintText: 'Phone',
                  icon: Icons.phone_outlined,
                ),

                const SizedBox(height: 15),

                AuthTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return PrimaryButton(
                      text: isLoading ? 'Creating...' : 'Sign Up',
                      onPressed: () {
                        if (isLoading) {
                          return;
                        }

                        context.read<AuthCubit>().register(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                            );
                      },
                    );
                  },
                ),

                const SizedBox(height: 15),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Already have an account? Login',
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