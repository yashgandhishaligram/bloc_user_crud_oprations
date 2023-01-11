part of 'adduser_bloc.dart';

abstract class AdduserState extends Equatable {
  String? selectedGender;

  AdduserState({this.selectedGender = ""});

  @override
  List<Object> get props => [selectedGender!];
}

class AdduserInitialState extends AdduserState {
  String? selectedGender;
  AdduserInitialState({required this.selectedGender})
      : super(selectedGender: selectedGender);

  @override
  List<Object> get props => [selectedGender!];
}

class AddUserLoadingState extends AdduserState {
  AddUserLoadingState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddUserSuccessState extends AdduserState {
  final UserModel userModel;
  AddUserSuccessState(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class GetUserListingState extends AdduserState {
  final List<UserModel> userList;
  GetUserListingState(this.userList);

  @override
  List<Object> get props => [userList];
}

class AddUserErrorState extends AdduserState {
  AppException exception;
  AddUserErrorState(this.exception);
  @override
  List<Object> get props => [];
}
