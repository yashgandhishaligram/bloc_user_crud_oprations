import 'package:bloc_user_crud_oprations/remote/dto/user_dto.dart';
import 'package:bloc_user_crud_oprations/remote/models/UserModel.dart';
import 'package:bloc_user_crud_oprations/storage/sql/sql_service.dart';

import '../../di/locator.dart';

class UserRepository {
  static final UserRepository _singleton = UserRepository._internal();

  UserRepository._internal();

  final sqlService = getIt.get<SQLService>();

  factory UserRepository() {
    return _singleton;
  }

  Future<UserModel?> addUserDetails(
      String name,
      int mobileNumber,
      String email,
      String gender,
      String jobPreference) async {
    try{
     await sqlService.addUser(name, mobileNumber, email, gender, jobPreference);
      return UserModel();
    }catch (e) {
      return null;
    }
  }

  Future<UserModel?> updateUserDetails(
      int id,
      String name,
      int mobileNumber,
      String email,
      String gender,
      String jobPreference) async {
    try{
       await sqlService.updateUser(id,name, mobileNumber, email, gender, jobPreference);
      return UserModel();
    }catch (e) {
      return null;
    }
  }

  Future fetchUserDetails() async {
    try {
       List<UserModel> usersList  = await sqlService.fetchUsers();
      return usersList;
    } catch (e) {
      return null;
    }
  }

  Future fetchUserDetailFromUserDTO() async {
    try {
      List<UserDTO> usersList  = await sqlService.fetchUsersFromUserDTO();
   /*  print("repository" + usersList.toString());*/
      return usersList;
    } catch (e) {
      return null;
    }
  }

  Future deleteUser(int userId) async {
    try {
      var deleteUser  = await sqlService.deleteUser(userId);
      return deleteUser;
    } catch (e) {
      return null;
    }
  }

}