import 'package:to_do_app/presentation/sign_in/sign_in_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:to_do_app/presentation/splash_page/splash_page.dart';

@MaterialAutoRouter(
    routes: <AutoRoute>[
      AutoRoute(page: SignInPage),
      AutoRoute(page: SplashPage, initial:true)
    ],
)
class $Router{

}
