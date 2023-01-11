part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitialState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashBoardLoadingState extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashBoardSuccessState extends DashboardState {
  final List<UserModel> userList;
  DashBoardSuccessState(this.userList);

  @override
  List<Object?> get props => [];

}

class DeleteUserState extends DashboardState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DashboardErrorState extends DashboardState {
  final AppException exception;
  DashboardErrorState(this.exception);
  @override
  List<Object?> get props => [];

}
