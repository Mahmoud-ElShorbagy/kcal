import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool get isFormValid {
    return RegExp(
          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        ).hasMatch(emailController.text) &&
        passwordController.text.length >= 6;
  }

  static LoginCubit get(context) => BlocProvider.of(context);
  void updateValidateEmail(String email) {
    emailController.text = email;
    emit(StateUpdate());
  }

  void updateValidatePassword(String password) {
    passwordController.text = password;
    emit(StateUpdate());
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      if (!isClosed) {
        emit(LoginLoading());
      }
      await Future.delayed(const Duration(seconds: 2));
      try {
        await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (!isClosed) {
          if (auth.currentUser!.emailVerified) {
            emit(const LoginSuccess(
                message: "Log in successfully welcome to kCal"));
          } else {
            emit(const SendVerification(
                message: "Please check your email to verify your account"));
          }
        }
      } on FirebaseAuthException catch (e) {
        if (!isClosed) {
          if (e.code == 'user-not-found') {
            emit(const LoginError(message: "No user found for that email."));
          } else if (e.code == 'wrong-password') {
            emit(const LoginError(
                message: "Wrong password provided for that user."));
          } else {
            emit(LoginFailure(message: e.toString()));
          }
        }
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
