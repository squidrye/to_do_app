import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
 const factory ValueFailure.auth(AuthFormValueFailure<T> f) = _Auth<T>;
 const factory ValueFailure.notes(NoteValueFailure<T> f) = _Note<T>;
}

@freezed
abstract class AuthFormValueFailure<T> with _$AuthFormValueFailure<T>{
  const factory AuthFormValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;

  const factory AuthFormValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;
}

@freezed
abstract class NoteValueFailure<T> with _$NoteValueFailure<T>{

  const factory NoteValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  const factory NoteValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  const factory NoteValueFailure.multiLine({
    required T failedValue,
  }) = MultiLine<T>;

  const factory NoteValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;
}