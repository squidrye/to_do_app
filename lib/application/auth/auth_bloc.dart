import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_app/domain/auth/i_auth_facade.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) {
      event.map(
        authCheckRequested: (input) async {
          final userOption = await _authFacade.getSignedInUser();
          emit(
            userOption.fold(
              () => const AuthState.loggedOut(),
              (_) => const AuthState.loggedIn(),
            ),
          );
        },
        signedOut: (input) async {
          await _authFacade.signOut();
          emit(
            const AuthState.loggedOut(),
          );
        },
      );
    });
  }
}
