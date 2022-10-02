import 'package:dartz/dartz.dart';
import 'package:to_do_app/domain/auth/auth_failure.dart';
import 'package:to_do_app/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  //facade is a design pattern which is used for connecting two or more classes
  // which have weird interfaces and you can't use those interfaces in your app
  // facade takes those classes and plugs them into a nice and unified interface.


  //once we start implementing the interface here its goning to depend on firebase
  // auth and google sigin in and so we do not need to depend on mutltiple classes
  // inside the application layer rather use this facade as a single class

  Future<Either<AuthFailure,Unit>> registerWithEmailAndPassword({
    required EmailAddress email,
    required Password pass,
  });

  Future<Either<AuthFailure,Unit>> signInWithEmailAndPassword({
  required EmailAddress email,
    required Password pass,
});

  Future<Either<AuthFailure,Unit>> signInWithGoogle();
}
