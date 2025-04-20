part of 'cubit.dart';

class TextChangeState {
  final int activeText;
  const TextChangeState({this.activeText = 0});
}

final class TextChangeInitial extends TextChangeState {
  const TextChangeInitial();
}
