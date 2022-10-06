import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/domain/auth/user.dart' as domain;
import 'package:to_do_app/domain/auth/value_objects.dart';

extension FirbaseUserX on User {
  domain.User toDomain() {
    return domain.User(
      id: UniqueId.fromUniqueString(this.uid),
    );
  }
}
