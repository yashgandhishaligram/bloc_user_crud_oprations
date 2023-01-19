import 'package:bloc/bloc.dart';
import 'package:bloc_user_crud_oprations/bloc/dashboard_freezed/dashboard_freezed_event.dart';
import 'package:bloc_user_crud_oprations/remote/dto/user_dto.dart';
import '../../exception/app_exception.dart';
import '../../remote/repository/user_repository.dart';
import 'dashboard_freezed_state.dart';

class DashboardFreezedBloc
    extends Bloc<DashboardFreezedEvent, DashboardFreezedState> {
  UserRepository? userRepository = UserRepository();
  DashboardFreezedBloc() : super(DashboardFreezedState.loading()) {
    on<DashboardFreezedEvent>((event, emit) async {
      if (event is FetchUsersEvent) {
        try {
          emit(DashboardFreezedState.loading());
          final List<UserDTO> userList =
              await userRepository!.fetchUserDetailFromUserDTO();
          if (userList.isNotEmpty) {
            emit(DashboardFreezedState.content(userList));
          } else {
            emit(DashboardFreezedState.error(AppException("No Chef Available")));
          }
        } on AppException catch (e) {
          emit(DashboardFreezedState.error(e));
        }
      }
      if(event is DeleteUsersEvent){
        try {
          await userRepository!.deleteUser(event.userId);
        } on AppException catch (e) {
          emit(DashboardFreezedState.error(e));
        }
      }
    });
  }
}
