import 'package:bloc_user_crud_oprations/presentation/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/splash/splash_bloc.dart';
import '../../di/locator.dart';
import '../../storage/shared_preference/shared_preference.dart';
import '../login/login_screen.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  bool? checkUserLogIn = false;
  final locator = getIt.get<SharedPreferenceHelper>();
  @override
  Widget build(BuildContext context) {
    checkUserLogIn = locator.getUsedLoggedIn();
    return  Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is SplashLoaded) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                    checkUserLogIn! ? DashboardScreen() : LoginPage(),
                  ),
                );
              }
            },
            child: _buildSplashWidget(),
          ),
        ),
      );
  }

  Widget _buildSplashWidget() {
    return  Center(
      child: Image.asset("assets/images/logo.png",
      height: 300,
      width: 300,)
    );
  }
}
