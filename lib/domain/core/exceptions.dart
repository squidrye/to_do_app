import 'package:to_do_app/domain/core/failures.dart';

class UnexpectedValueError extends Error{
  final  ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {

    return Error.safeToString("Failure Was $valueFailure");
  }
}