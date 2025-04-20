part of 'cubit.dart';

sealed class LoginState {
  const LoginState();
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String message;
  const LoginSuccess({required this.message});
}

final class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});
}

final class LoginFailure extends LoginState {
  final String message;
  const LoginFailure({required this.message});
}

final class SendVerification extends LoginState {
  final String message;
  const SendVerification({required this.message});
}

final class StateUpdate extends LoginState {}
