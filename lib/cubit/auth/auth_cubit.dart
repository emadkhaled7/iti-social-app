import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitial());

  
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      emit(AuthLoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(_getErrorMessage(e)));
    } catch (e) {
      emit(AuthError('Something went wrong. Please try again.'));
    }
  }

  // Register
  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      await credential.user?.updateDisplayName(name.trim());

      emit(AuthRegisterSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(_getErrorMessage(e)));
    } catch (e) {
      emit(AuthError('Something went wrong. Please try again.'));
    }
  }

  // Reset Password
  Future<void> resetPassword({
    required String email,
  }) async {
    emit(AuthLoading());

    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );

      emit(AuthResetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(_getErrorMessage(e)));
    } catch (e) {
      emit(AuthError('Something went wrong. Please try again.'));
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  String _getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';

      case 'user-not-found':
        return 'No account found with this email.';

      case 'wrong-password':
      case 'invalid-credential':
        return 'Incorrect email or password.';

      case 'email-already-in-use':
        return 'An account already exists with this email.';

      case 'weak-password':
        return 'Password is too weak.';

      case 'user-disabled':
        return 'This account has been disabled.';

      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';

      case 'network-request-failed':
        return 'Please check your internet connection.';

      default:
        return e.message ?? 'Authentication failed.';
    }
  }
}