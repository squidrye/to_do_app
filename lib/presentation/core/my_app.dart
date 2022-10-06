import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/application/auth/auth_bloc.dart';
import 'package:to_do_app/injection.dart';
import 'package:to_do_app/presentation/sign_in/sign_in_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:to_do_app/presentation/routes/router.gr.dart' as app_route;
class MyApp extends StatelessWidget {

final appRouter = app_route.Router();

MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        )
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
        routerDelegate: AutoRouterDelegate(appRouter),
        routeInformationParser: appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
