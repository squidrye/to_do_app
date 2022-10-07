import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:to_do_app/injection.dart';
import 'package:to_do_app/presentation/sign_in/widget/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: BlocProvider<SignInFormBloc>(
          create: (ctx) {
            return getIt<SignInFormBloc>();
          },
          child: const SignInForm(),
        ));
  }
}
