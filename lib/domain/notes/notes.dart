import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do_app/domain/auth/value_objects.dart';
import 'package:to_do_app/domain/notes/todo_item.dart';
import 'package:to_do_app/domain/notes/value_objects.dart';

import '../core/failures.dart';

part 'notes.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const Note._();

  const factory Note({
    required UniqueId id,
    required NoteBody body,
    required NoteColor color,
    required List3<TodoItem> todos,
  }) = _Note;

  factory Note.empty() {
    return Note(
      id: UniqueId(),
      body: NoteBody(''),
      color: NoteColor(NoteColor.predefinedColors[0]),
      todos: List3(const []),
    );
  }

  Option<NoteValueFailure<dynamic>> get failureOption {
    return body.failureOrUnit
        .andThen(todos.failureOrUnit)
        .fold(
          (l) => some(l),
          (_) => none(),
        );
  }
}
