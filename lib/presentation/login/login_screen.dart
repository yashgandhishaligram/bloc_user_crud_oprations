import 'dart:io';

import 'package:bloc_user_crud_oprations/presentation/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import '../../utils/validations/auth_form_validation.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
     onWillPop: () => _exitApp(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: const Text("Login"),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if(state is LoginLodingState){
                const CircularProgressIndicator();
              }else if(state is LoginSuccessState){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>  DashboardScreen()));
              }else if(state is LoginErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.exception.toString())),
                  );
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0.0),
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png",
                    height: 200,
                    width: 200),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) => AuthFormValidation().formValidation(value!, "email"),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: "Enter a Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) => AuthFormValidation().formValidation(value!, "password"),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange, // Background color
                      ),
                      onPressed: () {
                        _loginBtnTapped(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 50.0, right: 50, top: 15, bottom: 15),
                        child: Text("Login"),
                      )),
                ],
              ),
            ),
          )
      ),
    );
  }

  void _loginBtnTapped(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBloc.add(
      InitialLogin(emailController.text, passwordController.text),
    );
  }

  Future<bool> _exitApp() async {
    SystemNavigator.pop();
    return false;
  }

}
