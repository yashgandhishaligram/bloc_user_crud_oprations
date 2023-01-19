import 'package:bloc_user_crud_oprations/remote/dto/user_dto.dart';
import 'package:bloc_user_crud_oprations/remote/models/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLService {
  Database? db;

  Future openDB() async {
    try {
      // Get a location using getDatabasesPath
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, 'user.db');

      // open the database
      db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        this.db = db;
        createTables();
      });
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }

  createTables() async {
    try {
      var user = "CREATE TABLE IF NOT EXISTS users("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "mobile_number INTEGER,"
          "email TEXT,"
          "gender TEXT,"
          "job_preference TEXT)";
      await db?.execute(user);
    } catch (e) {
    }
  }

  Future<List<UserModel>> fetchUsers() async {
    try {
      final List<Map<String, Object?>> data = await db!.rawQuery("SELECT * FROM users", []);
      var result = data.map((e) => UserModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<UserDTO>> fetchUsersFromUserDTO() async {
    try {
      final List<Map<String, Object?>> data = await db!.rawQuery("SELECT * FROM users", []);
      var result = data.map((e) => UserDTO.fromJson(e)).toList();
      return result;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future addUser(name, mobileNumber, email, gender, jobPreference) async {
    await db?.transaction((txn) async {
      var qry =
          'INSERT INTO users(name,mobile_number ,email ,gender ,job_preference) VALUES("$name","$mobileNumber","$email","$gender","$jobPreference")';
      int id1 = await txn.rawInsert(qry);
      return id1;
    });
  }

  Future removeUser() async {
    var qry = "DELETE FROM users";
    return await db?.rawDelete(qry);
  }

  Future updateUser(int id, String name, int mobileNumber, String email,
      String gender, String jobPreference) async {
    try {
      /* var qry =
          "UPDATE users SET name = $name, mobile_number = $mobileNumber, email = $email, gender = $gender, job_preference = $jobPreference WHERE id = $id";*/
      return await db?.rawUpdate(
          '''UPDATE users  SET name = ?, mobile_number = ?,email = ?, gender = ?, job_preference = ?  WHERE id = ? ''',
          [name, mobileNumber, email, gender, jobPreference, id]);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future deleteUser(
    int userId,
  ) async {
    var qry = "DELETE FROM users where id = $userId";
    return await db?.rawDelete(qry);
  }
}
