import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityInitial());
  static PasswordVisibilityCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(PasswordVisibilityInitial());
  }
}
