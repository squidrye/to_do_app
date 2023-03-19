import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<AuthFormValueFailure<String>, String> validateEmailAddress(String email) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(email)) {
    return right(email);
  } else {
    return left(
      AuthFormValueFailure.invalidEmail(
        failedValue: email,
      ),
    );
  }
}

Either<AuthFormValueFailure<String>, String> validatePassword(String password) {
  if (password.length > 6 && password.isNotEmpty) {
    return right(password);
  } else {
    return left(AuthFormValueFailure.shortPassword(failedValue: password));
  }
}

Either<NoteValueFailure<String>, String> validateMaxStringLength(
    String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      NoteValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<NoteValueFailure<String>, String> validateFieldNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(NoteValueFailure.empty(failedValue: input));
  }
}

Either<NoteValueFailure<String>, String> validateSingleLine(String input) {
  if (!input.contains("\n")) {
    return right(input);
  } else {
    return left(NoteValueFailure.multiLine(failedValue: input));
  }
}

Either<NoteValueFailure<List<T>>, List<T>> validateMaxListLength<T>(
    List<T> input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      NoteValueFailure.listTooLong(failedValue: input, max: maxLength),
    );
  }
}
