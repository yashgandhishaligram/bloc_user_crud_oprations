import 'package:bloc_user_crud_oprations/bloc/dashboard/dashboard_bloc.dart';
import 'package:bloc_user_crud_oprations/bloc/login/login_bloc.dart';
import 'package:bloc_user_crud_oprations/bloc/splash/splash_bloc.dart';
import 'package:bloc_user_crud_oprations/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/add user/adduser_bloc.dart';
import 'di/locator.dart';
import 'storage/shared_preference/shared_preference.dart';
import 'storage/sql/sql_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
   final sharedPref = getIt.get<SharedPreferenceHelper>();
   final sql = getIt.get<SQLService>();
  @override
  Widget build(BuildContext context) {
    sharedPref.setUserCredentials();
    sql.openDB();
    return MultiBlocProvider(
      providers: [
        //Login Provider
        BlocProvider(
          create: (context) => SplashBloc()..add(NavigateEvent()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => AdduserBloc(),
        ),
        BlocProvider(
          create: (context) => DashboardBloc()..add(DashboardInitialEvent()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return  MaterialApp(
            title: "bloc_user_crud",
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            //LoginView()

            //
          );
        },
      ),
    );
  }
}
