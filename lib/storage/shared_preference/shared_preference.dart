
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {

  static const String token = "TOKEN";
  static const String credential = "CREDENTIALS";
  static const String userLoggedIn = "USER_LOGGED_IN";
  static const String email = "yash@shaligram.com";
  static const String password = "Yg@12345";


  final SharedPreferences prefs;

  SharedPreferenceHelper({required this.prefs});


  Future<void> setUserCredentials() async {
    await prefs.setStringList(credential,[email,password] );
  }

  List? getUserCredentials() {
    final credentials = prefs.getStringList(credential);
    return credentials;
  }

  Future<void> setUsedLoggedIn(bool? value) async {
    if(value!= null) {
      await prefs.setBool(userLoggedIn, value);
    }else{
      await prefs.setBool(userLoggedIn, false);
    }
  }

  bool? getUsedLoggedIn()  {
    var userLogIn = prefs.getBool(userLoggedIn);
    if(userLogIn != null) {
      return prefs.getBool(userLoggedIn);
    }else{
      return false;
    }
  }

 /* Future<void> setUserName({required String userName}) async {
    await prefs.setString(username, userName);
  }*/

 /* String? getUserName() {
    final userName = prefs.getString(username);
    return userName;
  }*/
}