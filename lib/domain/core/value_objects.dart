import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/domain/core/exceptions.dart';
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  ///throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash(){
    return value.fold((l) => throw UnexpectedValueError(l), (r) =>r);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ValueObject<T> &&
              value.runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value{value: $value}';
  }
} //currently equality is referential override == and hashcode for value equality
