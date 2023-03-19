import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/domain/core/exceptions.dart';
import 'failures.dart';

@immutable
abstract class AuthFormValueObject<T> {
  const AuthFormValueObject();

  Either<AuthFormValueFailure<T>, T> get value;

  ///throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    return value.fold((l) => throw UnexpectedValueError(ValueFailure.auth(l)), (r) => r);
  }

  Either<AuthFormValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthFormValueObject<T> && value.runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value{value: $value}';
  }
}

@immutable
abstract class NotesValueObject<T> {
  const NotesValueObject();

  Either<NoteValueFailure<T>, T> get value;

  ///throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    return value.fold((l) => throw UnexpectedValueError(ValueFailure.notes(l)), (r) => r);
  }

  Either<NoteValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesValueObject<T> && value.runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value{value: $value}';
  }
} //currently equality is referential override == and hashcode for value equality
