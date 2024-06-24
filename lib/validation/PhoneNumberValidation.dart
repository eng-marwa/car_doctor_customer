import 'package:formz/formz.dart';

import 'PhoneNumberInputError.dart';

class PhoneNumberInput extends FormzInput<String, PhoneNumberInputError> {
  const PhoneNumberInput.pure() : super.pure('');

  const PhoneNumberInput.dirty(super.value) : super.dirty();

  @override
  PhoneNumberInputError? validator(String value) {
    print(value.startsWith('01'));
    if (value.isEmpty) {
      return PhoneNumberInputError.empty;
    }
    if (value.length < 11) {
      return PhoneNumberInputError.invalid;
    }
    if (!value.startsWith("+201")) {
      return PhoneNumberInputError.not_saudi_number;
    }
    return null;
  }
}
