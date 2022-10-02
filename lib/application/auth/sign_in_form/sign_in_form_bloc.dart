import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:to_do_app/domain/auth/auth_failure.dart';
import 'package:to_do_app/domain/auth/i_auth_facade.dart';
import 'package:to_do_app/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      //might cause bug
      await event.map<FutureOr<void>>(
          emailChanged: (e) {
        emit(state.copyWith(
          email: EmailAddress(e.email),
          authFailureOrSuccessOption: none(),
        ));
      },
          passwordChanged: (e){
        emit(state.copyWith(
          pass: Password(e.pass),
          authFailureOrSuccessOption: none(),
        ));
      },
          registerWithEmailAndPasswordPressed: (e) async{
        Either<AuthFailure, Unit>? failureOrSuccess;
        if (state.email.isValid() && state.pass.isValid()) {
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );
          failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
              email: state.email, pass: state.pass);
        }
        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption:
              failureOrSuccess == null ? none() : some(failureOrSuccess),
        ));
      },
        signInWithEmailAndPasswordPressed: (e) async{
        if (state.email.isValid() && state.pass.isValid()) {
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
              email: state.email, pass: state.pass);
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: some(failureOrSuccess),
          ));
        }
        emit(state.copyWith(
          showErrorMessages: true,
          authFailureOrSuccessOption: none(),
        ));
      },
          signInWithGooglePressed: (e) async{
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        emit(state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: some(failureOrSuccess),
        ));
      });
    });
  }
}
