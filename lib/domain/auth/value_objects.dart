//making illegal states irrepresentable
import 'package:dartz/dartz.dart';
import 'package:to_do_app/domain/core/value_objects.dart';

import 'package:to_do_app/domain/core/failures.dart';
import 'package:to_do_app/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String value) {
    return EmailAddress._(
      validateEmailAddress(value),
    );
  }
  const EmailAddress._(this.value);

}

class Password extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String> value;

  const Password._(this.value);

  factory Password(String value){
    return Password._(
      validatePassword(value)
    );
  }
}







// void showingOutputOnUIExample(){
//   final emailAddress = EmailAddress('fasfasd');
//    String emailText = emailAddress.value.fold(
//        (left)=> 'Failure happened to be precise $left',
//        (right)=>right
//    );
//
//    //another way
//   final emailAddress2 = EmailAddress("fdasfa").value.getOrElse(() => "Some error happened can't tell precisely")
// }