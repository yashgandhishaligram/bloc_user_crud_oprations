import 'package:bloc/bloc.dart';
import 'package:bloc_user_crud_oprations/remote/models/UserModel.dart';
import 'package:equatable/equatable.dart';

import '../../exception/app_exception.dart';
import '../../remote/repository/user_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  UserRepository userRepository = UserRepository();
  DashboardBloc() : super(DashboardInitialState()) {
    on<DashboardInitialEvent>((event, emit) async {
      try {
        emit(DashBoardLoadingState());
        List<UserModel> userList = await userRepository.fetchUserDetails();
        if (userList.isNotEmpty) {
          emit(DashBoardSuccessState(userList));
        } else {
          emit(DashboardErrorState(AppException("No Data Found")));
        }
      } on AppException catch (e) {
        emit(DashboardErrorState(e));
      }
    });
    on<DeleteUserEvent>((event, emit) async {
      try {
        await userRepository.deleteUser(event.userId);
      } on AppException catch (e) {
        emit(DashboardErrorState(e));
      }
    });
  }
}
