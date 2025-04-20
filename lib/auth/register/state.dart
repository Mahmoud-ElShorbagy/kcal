part of 'cubit.dart';

sealed class RegisterState {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String message;
  const RegisterSuccess({required this.message});
}

final class RegisterError extends RegisterState {
  final String message;
  const RegisterError({required this.message});
}

final class RegisterFailure extends RegisterState {
  final String message;
  const RegisterFailure({required this.message});
}

final class StateUpdate extends RegisterState {}
