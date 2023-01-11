import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_user_crud_oprations/remote/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../exception/app_exception.dart';
import '../../../remote/models/UserModel.dart';

part 'adduser_event.dart';
part 'adduser_state.dart';

class AdduserBloc extends Bloc<AdduserEvent, AdduserState> {
  UserRepository userRepository = UserRepository();
  AdduserBloc() : super(AdduserInitialState(selectedGender: "")) {
    on<SelectGenderEvent>((event, emit) {
      emit(AdduserInitialState(selectedGender: event.selectvalue!));
    });
    on<AddUserDetailsEvent>((event, emit) async {
      emit(AddUserLoadingState());
      try {
        var userModel = await userRepository.addUserDetails(event.name,
            event.phoneNumber, event.email, event.gender, event.jobPref);
        emit(AddUserSuccessState(userModel!));
      } on AppException catch (e) {
        emit(AddUserErrorState(e));
      }
    });
    on<UpdateUserDetailsEvent>((event, emit) async {
      emit(AddUserLoadingState());
      try {
        var userModel = await userRepository.updateUserDetails(
            event.id,
            event.name,
            event.phoneNumber,
            event.email,
            event.gender,
            event.jobPref);
        emit(AddUserSuccessState(userModel!));
      } on AppException catch (e) {
        emit(AddUserErrorState(e));
      }
    });
  }
}
