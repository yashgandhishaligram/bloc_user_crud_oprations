import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_freezed_event.freezed.dart';

@freezed
class DashboardFreezedEvent with _$DashboardFreezedEvent {
factory DashboardFreezedEvent.fetchUsers() =  FetchUsersEvent;
factory DashboardFreezedEvent.deleteUser(int userId) =  DeleteUsersEvent;
}
