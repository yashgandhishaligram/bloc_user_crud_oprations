import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_user_crud_oprations/exception/app_exception.dart';
import 'package:bloc_user_crud_oprations/remote/models/LoginModel.dart';
import 'package:bloc_user_crud_oprations/remote/repository/login_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _loginRepository = AuthRepository();

  LoginBloc() : super(LoginInitial())  {
    on<InitialLogin>((event, emit) async {

      if(event.email.isEmpty){
        emit(LoginErrorState(AppException("Please enter valid email")));
      }else if(event.password.isEmpty){
        emit(LoginErrorState(AppException("Please enter valid password")));
      }else {
        emit(LoginLodingState());
        try{
          var loginModel = await _loginRepository.requestLogin(event.email, event.password);
          if(loginModel!=null){
            emit(LoginSuccessState(loginModel));
          }else{
            emit(LoginErrorState(AppException("Invalid Login Credentials.")));
          }
        }on AppException catch (e){
          emit(LoginErrorState(e));
        }

      }

    });
  }
}
