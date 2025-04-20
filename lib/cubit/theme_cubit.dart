import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(_lightTheme));
  bool changeTheme = false;
  static ThemeCubit get(context) => BlocProvider.of(context);
  static final _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    emit(ThemeState(state.themeData.brightness == Brightness.dark
        ? _lightTheme
        : _darkTheme));
    changeTheme = !changeTheme;
  }
}
