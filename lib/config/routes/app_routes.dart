import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/Auth/views/screens/signin_screen.dart';
import '../../features/Auth/views/screens/signup_screen.dart';
import '../../features/Home/views/screens/home.dart';


class Routes {
 
  static const signUpRoute = '/';
   static const signInRoute = '/SignInScreen';
  static const homeRoute = '/HomeScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (Routes.signInRoute):
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case (Routes.signUpRoute):
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );
      case (Routes.homeRoute):
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
       undefiendRoute ;  
    }
    return null;
  }

  static Route<dynamic> undefiendRoute(){
     return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.undefiendRoute),
            )
          ),
        );
  }
}
