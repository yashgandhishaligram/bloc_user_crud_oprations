import 'package:bloc_user_crud_oprations/bloc/dashboard_freezed/dashboard_freezed_bloc.dart';
import 'package:bloc_user_crud_oprations/bloc/dashboard_freezed/dashboard_freezed_event.dart';
import 'package:bloc_user_crud_oprations/bloc/dashboard_freezed/dashboard_freezed_state.dart';
import 'package:bloc_user_crud_oprations/presentation/dashboard/add_user_screen.dart';
import 'package:bloc_user_crud_oprations/remote/dto/user_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/locator.dart';
import '../../storage/shared_preference/shared_preference.dart';
import '../login/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final locator = getIt.get<SharedPreferenceHelper>();
  DashboardFreezedBloc? dashboardFreezeBloc;
  Widget? view;

  @override
  Widget build(BuildContext context) {
    dashboardFreezeBloc = BlocProvider.of<DashboardFreezedBloc>(context);
    view = const SizedBox();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Best Chefs"),
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
                  showAlertDialog(context);
                },
                icon: const Icon(Icons.logout_outlined,
                    color: Colors.white, size: 30))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            dashboardFreezeBloc!.add(DashboardFreezedEvent.fetchUsers());
          },
          child : BlocBuilder<DashboardFreezedBloc, DashboardFreezedState>(
            builder: (context, state) {
              state.when(
                loading: () {
                  view =  Center(
                      child: CircularProgressIndicator(color: Colors.green));
                },
                content : (listData) {
                  view = _getUserListView(listData);
                },
                error: (e) {
                  view = showNoDataView(e);
                }
              );
              return view!;
            },
          ),
        ));
  }

  Widget _getUserListView(List<UserDTO> snapshot) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0))),
      child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: snapshot.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
          /*  print("index data" + snapshot[index].name.toString());*/
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
                                dashboardFreezeBloc!.add(DashboardFreezedEvent.deleteUser(snapshot[index].id!));
                                dashboardFreezeBloc!.add(DashboardFreezedEvent.fetchUsers());
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


  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure you want to Logout?"),
      actions: [
        TextButton(
            onPressed: () {
           Navigator.pop(context);
        }, child: const Text("Cancel",style: TextStyle(color: Colors.grey),)),
        TextButton(
            onPressed: () async {
              await locator.setUsedLoggedIn(false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ( context) => LoginPage(),
                ),
              );
        }, child: const Text("Logout")),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  showNoDataView(error){
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.no_accounts_outlined,size: 80,color: Colors.green),
          SizedBox(height: 5),
          Text(error.toString(),
            style: TextStyle(
            color: Colors.green,
            fontSize: 20,
              fontWeight: FontWeight.w500
          ),
          ),
          SizedBox(height: 8),
          Text("click on " + "+" + " icon to add new chef",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
