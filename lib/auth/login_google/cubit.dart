import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'state.dart';

class SignInGoogleCubit extends Cubit<SignInGoogleState> {
  SignInGoogleCubit() : super(SignInGoogleInitial());
  static SignInGoogleCubit get(context) => BlocProvider.of(context);
  Future signInWithGoogle() async {
    try {
      emit(SignInGoogleLoading());
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(const SignInGoogleError(message: "Sign in process cancelled"));
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      emit(const SignInGoogleSuccess(
          message: "Login successfully welcome to kCal"));
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      emit(SignInGoogleError(message: e.toString()));
      //  return null;
    }
  }
}
