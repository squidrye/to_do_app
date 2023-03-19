import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do_app/domain/auth/value_objects.dart';
import 'package:to_do_app/domain/core/failures.dart';
import 'package:to_do_app/domain/notes/value_objects.dart';

part 'todo_item.freezed.dart';

//to add custom function to freezed class implement rather than mixing in generated class and provide an empty constructor
@freezed
abstract class TodoItem implements _$TodoItem {
  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  const TodoItem._();

  factory TodoItem.empty() {
    return TodoItem(
      name: TodoName(''),
      id: UniqueId(),
      done: false,
    );
  }

  Option<NoteValueFailure<dynamic>> get failureOption {
    return name.value.fold(
      (l) => some(l),
      (_) => none(),
    );
  }
}
