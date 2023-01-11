part of 'adduser_bloc.dart';

abstract class AdduserEvent extends Equatable {
  const AdduserEvent();
}

class AddUserDetailsEvent extends AdduserEvent {
  final String name, email, gender, jobPref;
  final int phoneNumber;
  const AddUserDetailsEvent(
      this.name, this.phoneNumber, this.email, this.gender, this.jobPref);

  @override
  // TODO: implement props
  List<Object?> get props => [email, phoneNumber, email, gender, jobPref];
}

class UpdateUserDetailsEvent extends AdduserEvent {
  final String name, email, gender, jobPref;
  final int id, phoneNumber;
  const UpdateUserDetailsEvent(this.id, this.name, this.phoneNumber, this.email,
      this.gender, this.jobPref);

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, phoneNumber, email, gender, jobPref];
}

class SelectGenderEvent extends AdduserEvent {
  String? selectvalue;
  SelectGenderEvent(this.selectvalue);
  @override
  // TODO: implement props
  List<Object?> get props => [selectvalue!];
}

class GetUserListEvent extends AdduserEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
