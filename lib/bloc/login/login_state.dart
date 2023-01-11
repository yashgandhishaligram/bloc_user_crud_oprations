part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLodingState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState{
  AppException exception;
  LoginErrorState(this.exception);
  @override
  List<Object?> get props => [];
}
