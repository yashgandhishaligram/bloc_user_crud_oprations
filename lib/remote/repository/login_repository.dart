import 'package:bloc_user_crud_oprations/storage/shared_preference/shared_preference.dart';
import '../../di/locator.dart';
import '../models/LoginModel.dart';

class AuthRepository {
  static final AuthRepository _singleton = AuthRepository._internal();

  AuthRepository._internal();

  final _sharedPref = getIt.get<SharedPreferenceHelper>();

  factory AuthRepository() {
    return _singleton;
  }

  Future<LoginModel?> requestLogin(String email,String password) async {
    List? userCredentials = await _sharedPref.getUserCredentials();
    if(email== userCredentials![0] && password == userCredentials[1]){
      await _sharedPref.setUsedLoggedIn(true);
      return LoginModel(email: email, password: password);
    }else{
     return null;
    }
  }

}