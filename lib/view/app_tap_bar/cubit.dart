import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class TextChangeCubit extends Cubit<TextChangeState> {
  TextChangeCubit() : super(const TextChangeInitial());
  static TextChangeCubit get(context) {
    return BlocProvider.of<TextChangeCubit>(context);
  }

  void updateText(int newValue) {
    emit(TextChangeState(
      activeText: newValue,
    ));
  }
}
