import 'dart:async';

import 'package:bloc_clean/config/routes/routes_name.dart';
import 'package:bloc_clean/services/session_manager/session_controller.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {

  void isLogin(BuildContext context) {

    // session manage ka concept use krenge ki agr phle se data save rhe to next page p jayega
    SessionController().getUserFromPreference().then((value) {

// condition k hisab se login screen ya home screen pe jayega
      if(SessionController().isLogin ?? false) {
        Timer(Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false));

      } else {
        Timer(Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false));

      }
    }).onError((error, stackTrace){
    Timer(Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false));

    });

  }
}