import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:to_do_app/infrastructure/auth/firebase_auth_facade.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(() => {}, (either) {
          either.fold(
            (failure) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  failure.map(
                    cancelledByUser: (val) => "$val",
                    emailAlreadyInUse: (val) => "email already in use",
                    serverError: (val) => "Server Error",
                    invalidEmailAndPasswordCombination: (val) =>
                        "Invalid Combo",
                  ),
                ),
              ),
            ),
            (_) => null,
          );
        });
      },
      builder: (context, state) {
        return Container(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                const Text(
                  '📝',
                  style: TextStyle(fontSize: 70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  autocorrect: false,
                  onChanged: (val) {
                    return context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.emailChanged(val));
                  },
                  validator: (_) {
                    return state.email.value.fold(
                      (l) => l.maybeMap(
                        invalidEmail: (_) => 'invalidEmail',
                        orElse: () {
                          return null;
                        },
                      ),
                      (_) => null,
                    );
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  validator: (_) {
                    return state.pass.value.fold(
                      (l) => l.maybeMap(
                        shortPassword: (_) => 'short password',
                        orElse: () {
                          return null;
                        },
                      ),
                      (_) => null,
                    );
                  },
                  onChanged: (val) {
                    context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.passwordChanged(val));
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  autocorrect: false,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.read<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .signInWithEmailAndPasswordPressed(),
                              );
                        },
                        child: const Text("Sign in"),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.read<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .registerWithEmailAndPasswordPressed(),
                              );
                        },
                        child: const Text("Register"),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<SignInFormBloc>().add(
                          const SignInFormEvent.signInWithGooglePressed(),
                        );
                  },
                  child: const Text("SIGN IN WITH GOOGLE"),
                ),
                if (state.isSubmitting) ...[
                  const SizedBox(
                    height: 8,
                  ),
                  const LinearProgressIndicator(),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
