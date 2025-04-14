part of 'cubit.dart';

class TextChangeState extends Equatable {
  final int activeText;
  const TextChangeState({this.activeText = 0});
  @override
  List<Object> get props => [activeText];
}

final class TextChangeInitial extends TextChangeState {
  const TextChangeInitial();
}
