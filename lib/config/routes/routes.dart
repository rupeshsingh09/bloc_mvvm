import 'package:bloc_clean/config/routes/routes_name.dart';

import 'package:flutter/material.dart';

// ye impport kiye h taki sare ko alg alg import n krna pade
import '../../views/view.dart';


// kaise kaise page routes hoga sb login esme rhega
class Routes {
  // generate route ki help se route generate hoga ur usme ek variablle denge jo ki routesSetting h
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) =>const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) =>const LoginScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) =>const HomeScreen());
      // agr aisa page denge jo rouutes.name me exists ho n kre to by defaults yhi msg show kr dega
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(body: Center(child: Text('No Page exist')));
          },
        );
    }
  }
}
