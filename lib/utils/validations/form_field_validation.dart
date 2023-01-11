
class FormFieldValidation {

  String? emailField(String value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return "Email can't be empty";
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid email';
      }
   /*   else if (!controller.useraleady.value) {
        return controller.masses;
      }*/
      else {
        return null;
      }
    }
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{0,}$');
    if (value.isEmpty) {
      return "Password can't be empty";
    } else {
      if (!regex.hasMatch(value)) {
        return 'Password must have A-Z, a-z, 0-9 and min. one special characters';
      } else if (value.length < 8) {
        return 'Min. 8 characters required';
      } else {
        return null;
      }
    }
  }
}
