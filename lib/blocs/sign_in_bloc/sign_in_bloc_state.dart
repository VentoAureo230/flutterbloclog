part of 'sign_in_bloc_bloc.dart';

sealed class SignInBlocState extends Equatable {
  const SignInBlocState();

  @override
  List<Object> get props => [];
}

final class SignInBlocInitial extends SignInBlocState {}

class SignInBlocSuccess extends SignInBlocState {}

class SignInBlocFailure extends SignInBlocState {
  final String? message;

  const SignInBlocFailure({this.message});
}

class SignInBlocProcess extends SignInBlocState {}
