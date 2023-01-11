import 'package:bloc_user_crud_oprations/bloc/dashboard/dashboard_bloc.dart';
import 'package:bloc_user_crud_oprations/presentation/dashboard/add_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/locator.dart';
import '../../remote/models/UserModel.dart';
import '../../storage/shared_preference/shared_preference.dart';
import '../login/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final locator = getIt.get<SharedPreferenceHelper>();
  DashboardBloc? dashboardBloc;
  @override
  Widget build(BuildContext context) {
    dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Best Safes"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddUserDetails(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add_circle_outline_outlined,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () async {
                  await locator.setUsedLoggedIn(false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.logout_outlined,
                    color: Colors.white, size: 30))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            dashboardBloc!.add(DashboardInitialEvent());
          },
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashBoardLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.green));
              } else if (state is DashBoardSuccessState) {
                return _getUserListView(state.userList);
              } else if (state is DashboardErrorState) {
                return Center(child: Text(state.exception.toString()));
              } else {
                return Container();
              }
            },
          ),
        ));
  }

  Widget _getUserListView(List<UserModel> snapshot) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0))),
      child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: snapshot.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                child: Stack(
                  children: [
                    Positioned(
                        right: 0.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddUserDetails(
                                            data: snapshot[index],
                                            addFlag: false),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                dashboardBloc!
                                    .add(DeleteUserEvent(snapshot[index].id!));
                                dashboardBloc!.add(DashboardInitialEvent());
                              },
                            ),
                          ],
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              snapshot[index].name.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              snapshot[index].mobileNumber.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              snapshot[index].email.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(
                              Icons.transgender,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              snapshot[index].gender.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(
                              Icons.paid_rounded,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              snapshot[index].jobPreference.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
