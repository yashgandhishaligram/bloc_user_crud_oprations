import 'package:bloc_user_crud_oprations/exception/app_exception.dart';
import 'package:bloc_user_crud_oprations/remote/dto/user_dto.dart';
import 'package:bloc_user_crud_oprations/remote/models/UserModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_freezed_state.freezed.dart';


@freezed
class DashboardFreezedState with _$DashboardFreezedState {
 factory DashboardFreezedState.loading() = _DashboradLoading;
 factory DashboardFreezedState.content(List<UserDTO> userList) = _DashboradLoaded;
 factory DashboardFreezedState.error(AppException appException) = _Dashboraderror;
}