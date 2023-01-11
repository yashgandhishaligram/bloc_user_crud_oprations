import 'package:bloc_user_crud_oprations/storage/sql/sql_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import '../storage/shared_preference/shared_preference.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferenceHelper>(
    SharedPreferenceHelper(prefs: prefs),
  );
  getIt.registerSingleton<SQLService>(
    SQLService(),
  );
}