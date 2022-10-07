import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String email) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(email)) {
    return right(email);
  } else {
    return left(
      ValueFailure.invalidEmail(
        failedValue: email,
      ),
    );
  }
}

Either<ValueFailure<String>, String> validatePassword(String password) {
  if (password.length > 6 && password.isNotEmpty) {
    return right(password);
  } else {
    return left(ValueFailure.shortPassword(failedValue: password));
  }
}

Either<ValueFailure<String>, String> validateMaxStringLength(
    String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateFieldNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (!input.contains("\n")) {
    return right(input);
  } else {
    return left(ValueFailure.multiLine(failedValue: input));
  }
}

Either<ValueFailure<List<T>>, List<T>> validateMaxListLength<T>(
    List<T> input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.listTooLong(failedValue: input, max: maxLength),
    );
  }
}
