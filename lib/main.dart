import 'package:bloc_clean/repository/auth/login_http_api_repository.dart';
import 'package:bloc_clean/repository/auth/login_repository.dart';
import 'package:bloc_clean/views/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';

// concept of getIt dependency
// getit ka instance create kr rhe h
GetIt getIt = GetIt.instance;


void main() {
  // fun. create kr rhe h getit se related
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // jb project open hoga to first page kon sa open ho chanhuye vh initial route me deenge
      initialRoute: RoutesName.splashScreen,
      // splashscreen pe jayega the routes.generateroute ke class me jakr vha se data lega ki ab aage kis page pe jana hai
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
 
// concept of getIt 
void serviceLocator(){
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
}
