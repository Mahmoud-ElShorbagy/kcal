import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kcal/bloc_observer.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
