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
     fetchUserDetails();
      return UserModel();
    }catch (e) {
      print(e);
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
      var update = await sqlService.updateUser(id,name, mobileNumber, email, gender, jobPreference);
      /*fetchUserDetails();*/
      print("update "   + update.toString());
      return UserModel();
    }catch (e) {
      print(e);
      return null;
    }
  }

  Future fetchUserDetails() async {
    try {
       List<UserModel> usersList  = await sqlService.fetchUsers();
      return usersList;
    } catch (e) {
      print(e);
    }
  }

  Future deleteUser(int userId) async {
    try {
      var deleteUser  = await sqlService.deleteUser(userId);
      print("delete----------" + deleteUser.toString());
      return deleteUser;
    } catch (e) {
      print(e);
    }
  }

}