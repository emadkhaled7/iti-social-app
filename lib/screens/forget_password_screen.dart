import 'package:app/cubit/auth/auth_cubit.dart';
import 'package:app/cubit/auth/auth_state.dart';
import 'package:app/widgets/auth_header.dart';
import 'package:app/widgets/auth_text_field.dart';
import 'package:app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Password reset email sent. Check your inbox.',
              ),
            ),
          );

          Navigator.pop(context);
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(
                  title: 'Forgot Password',
                ),

                const SizedBox(height: 40),

                AuthTextField(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 30),

                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return PrimaryButton(
                      text: isLoading
                          ? 'Sending...'
                          : 'Reset Password',
                      onPressed: () {
                        if (isLoading) {
                          return;
                        }

                        context.read<AuthCubit>().resetPassword(
                              email: emailController.text,
                            );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}