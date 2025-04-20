part of 'cubit.dart';

sealed class SignInGoogleState extends Equatable {
  const SignInGoogleState();

  @override
  List<Object> get props => [];
}

final class SignInGoogleInitial extends SignInGoogleState {}

final class SignInGoogleLoading extends SignInGoogleState {}

final class SignInGoogleSuccess extends SignInGoogleState {
  final String message;
  const SignInGoogleSuccess({required this.message});
}

final class SignInGoogleError extends SignInGoogleState {
  final String message;
  const SignInGoogleError({required this.message});
}
