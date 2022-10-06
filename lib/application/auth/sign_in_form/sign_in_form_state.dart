part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress email,
    required Password pass,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<AuthFailure,Unit>> authFailureOrSuccessOption

  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
    email: EmailAddress(''),
    pass: Password(''),
    authFailureOrSuccessOption: none(),
    isSubmitting: false,
    showErrorMessages: false
  );
}
