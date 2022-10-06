part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState{
  const factory AuthState.initial() = Initial; //for when we don't know if user is authenticated or not
  const factory AuthState.loggedIn() = LoggedIn;
  const factory AuthState.loggedOut() = LoggedOut;
}