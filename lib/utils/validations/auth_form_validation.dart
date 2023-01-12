import 'form_field_validation.dart';

class AuthFormValidation {
  FormFieldValidation formFieldValidation = FormFieldValidation();

  String? formValidation(String value, String field) {
    switch (field) {
      case "email":
        return formFieldValidation.emailField(value);

      case "password":
        return formFieldValidation.validatePassword(value);

      case "name":
        return formFieldValidation.validateName(value);

      case "number":
        return formFieldValidation.validateNumber(value);
    }
    return null;
  }
}
