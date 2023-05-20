
import '../constants/text_string.dart';

class Validator {

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return jEmailRequired;
    } else if (!RegExp(r'^[\w-\\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return jLoginScreenEmailFieldValidatorText;
    }
    return null;
  }

}