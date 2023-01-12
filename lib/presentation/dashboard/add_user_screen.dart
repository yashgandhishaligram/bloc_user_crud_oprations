import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bloc/add user/adduser_bloc.dart';
import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../remote/models/UserModel.dart';
import '../../utils/validations/auth_form_validation.dart';

class AddUserDetails extends StatefulWidget {
  AddUserDetails({Key? key, this.data, this.addFlag = true}) : super(key: key);
  UserModel? data;
  bool addFlag;

  @override
  State<AddUserDetails> createState() => _AddUserDetailsState();
}

class _AddUserDetailsState extends State<AddUserDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? gender;
  String? selectedJobPref;
  var jobPrefList = ['Full Time', 'Part Time', 'Hourly Base'];
  AdduserBloc? adduserBloc;
  DashboardBloc? dashboardBloc;
  int? userId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.addFlag ? null : setUserData(widget.data!, widget.addFlag);
  }

  @override
  Widget build(BuildContext context) {
    adduserBloc = BlocProvider.of<AdduserBloc>(context);
    dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(widget.addFlag ? "Add User" : "Edit User"),
          centerTitle: true,
        ),
        body:
            BlocConsumer<AdduserBloc, AdduserState>(
                builder: (context, state) {
          return _addUserView(state);
        }, listener: (context, state) {
          if (state is AddUserSuccessState) {
            Navigator.pop(context);
            dashboardBloc!.add(DashboardInitialEvent());
            Fluttertoast.showToast(
                msg: widget.addFlag
                    ? "User Added successfully"
                    : "User Updated successfully");
          }
        }));
  }

  setUserData(UserModel data, bool addFlag) {
    if (addFlag == false) {
      nameController.text = data.name!;
      numberController.text = data.mobileNumber!.toString();
      emailController.text = data.email!;
      gender = addFlag? "" : data.gender!;
      selectedJobPref = data.jobPreference!;
      userId = data.id!;
    }
  }

  Widget _addUserView(state) {
    final formKey = GlobalKey<FormState>();
/*    state.selectedGender = gender;*/
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Enter Name",
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
              validator: (value) =>
                  AuthFormValidation().formValidation(value!, "name"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: numberController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Enter Phone Number",
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
                counterText: "",
              ),
              maxLength: 12,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) =>
                  AuthFormValidation().formValidation(value!, "number"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
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
              validator: (value) =>
                  AuthFormValidation().formValidation(value!, "email"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select gender :",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            RadioListTile(
              title: const Text("Male"),
              value: "male",
              groupValue: state.selectedGender,
              onChanged: (value) {
                adduserBloc!.add(SelectGenderEvent(value.toString()));
              },
            ),
            RadioListTile(
              title: const Text("Female"),
              value: "female",
              groupValue: state.selectedGender,
              onChanged: (value) {
                adduserBloc!.add(SelectGenderEvent(value.toString()));
              },
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Job Preference :",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                          blurRadius: 5) //blur radius of shadow
                    ]),
                child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: DropdownButtonFormField(
                      hint: const Text(
                        "Select Job Preference",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: selectedJobPref,
                      borderRadius: BorderRadius.circular(10),
                      items: jobPrefList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedJobPref = value;
                      },
                      isExpanded: true,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                      dropdownColor: Colors.blueGrey,
                      iconEnabledColor: Colors.white, //Icon color
                    ))),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Background color
                ),
                onPressed: () {
                  validateUserDetails(formKey, state);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 15, bottom: 15),
                  child: Text(widget.addFlag ? "Submit" : "Update"),
                )),
          ],
        ),
      ),
    );
  }

  Widget buildDropDown(state) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: DropdownButtonFormField(
              hint: const Text(
                "Select Job Preference",
                style: TextStyle(color: Colors.white),
              ),
              value: state.selectedJobPref,
              borderRadius: BorderRadius.circular(10),
              items: state.jobPrefList.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (value) {
                state.selectedJobPref = value;
              },
              isExpanded: true,
              style: TextStyle(fontSize: 18, color: Colors.white),
              dropdownColor: Colors.blueGrey,
              iconEnabledColor: Colors.white, //Icon color
            )));
  }

  showSnackBar(String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

  validateUserDetails(formKey, state) {
    if (formKey.currentState!.validate()) {
      if (state.selectedGender == null || state.selectedGender == "") {
        showSnackBar("Please select Gender");
      } else if (selectedJobPref == null || selectedJobPref == "") {
        showSnackBar("Please select Job Preference");
      } else {
        if (widget.addFlag) {
          adduserBloc!.add(AddUserDetailsEvent(
              nameController.text,
              int.parse(numberController.text),
              emailController.text,
              state.selectedGender.toString(),
              selectedJobPref.toString()));
        } else {
          adduserBloc!.add(UpdateUserDetailsEvent(
              widget.data!.id!,
              nameController.text,
              int.parse(numberController.text),
              emailController.text.toString(),
              state.selectedGender.toString(),
              selectedJobPref.toString()));
        }
      }
    } else {
      showSnackBar("Please Complete All Require Details");
    }
  }
}
