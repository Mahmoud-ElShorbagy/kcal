import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial()) {
    loadName();
  }
  static RegisterCubit get(context) => BlocProvider.of(context);
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool get isFormValid {
    return nameController.text.length >= 2 &&
        nameController.text.length <= 20 &&
        RegExp(
          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        ).hasMatch(emailController.text) &&
        passwordController.text.length >= 6;
  }

  Future<void> saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("saved_name", nameController.text);

    emit(StateUpdate());
  }

  Future<void> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString("saved_name") ?? "";
    if (savedName.isNotEmpty) {
      nameController.text = savedName;
    }
    emit(StateUpdate());
  }

  void updateValidateName(String name) {
    nameController.text = name;
    emit(StateUpdate());
  }

  void updateValidateEmail(String email) {
    emailController.text = email;
    emit(StateUpdate());
  }

  void updateValidatePassword(String password) {
    passwordController.text = password;
    emit(StateUpdate());
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      await Future.delayed(const Duration(seconds: 2));

      try {
        await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        await saveName();
        emit(const RegisterSuccess(
            message: "The account has been created successfully."));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(const RegisterError(
              message: "The password provided is too weak."));
        }
        if (e.code == 'email-already-in-use') {
          emit(const RegisterError(
              message:
                  "The account already exists for that email. please go back and enter a new email."));
        } else {
          emit(RegisterFailure(message: e.toString()));
        }
      }
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
