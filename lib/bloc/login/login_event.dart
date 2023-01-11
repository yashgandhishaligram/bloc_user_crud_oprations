part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}


class InitialLogin extends LoginEvent{

  final String email, password;

  const InitialLogin(this.email,this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}

