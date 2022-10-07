import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:to_do_app/domain/core/value_objects.dart';
import 'package:to_do_app/domain/core/value_transformer.dart';
import '../core/value_validators.dart';
import 'package:to_do_app/domain/core/failures.dart';

class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 1000;

  factory NoteBody(String input) {
    return NoteBody._(
      validateMaxStringLength(input, maxLength)
          .flatMap((a) => validateFieldNotEmpty(a)),
    );
  }

  const NoteBody._(this.value);
}

class TodoName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 30;

  factory TodoName(String input) {
    return TodoName._(
      validateMaxStringLength(input, maxLength)
          .flatMap((a) => validateFieldNotEmpty(a))
          .flatMap((a) => validateSingleLine(a)),
    );
  }

  const TodoName._(this.value);
}

class List3<T> extends ValueObject<List<T>> {
  @override
  final Either<ValueFailure<List<T>>, List<T>> value;
  static const maxLength = 3;

  factory List3(List<T> input) {
    return List3._(
      validateMaxListLength(input, maxLength)
    );
  }

  const List3._(this.value);

  int get length{
    return value.getOrElse(() => []).length;
  }
  bool get isFull{
    return length == maxLength;
  }
}

class NoteColor extends ValueObject{
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];
  @override
  final Either<ValueFailure<Color>, Color> value;

  factory NoteColor(Color input){
    return NoteColor._(
        right(makeColorOpaqe(input))
    );
  }
  const NoteColor._(this.value);
}