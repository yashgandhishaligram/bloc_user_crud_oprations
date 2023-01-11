part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DashboardInitialEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class DeleteUserEvent extends DashboardEvent {
  final int userId;
  DeleteUserEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
