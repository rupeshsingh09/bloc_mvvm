import 'dart:convert';

import 'package:bloc_clean/models/user/user_model.dart';
import 'package:bloc_clean/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';

class SessionController {
  // final esliye bnye h kyuki eska value change nh ho skta
  static final SessionController _session = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  // variable create kr rhe h
  bool isLogin;
  // private constructor create kiye h , and ye fromate h private bnnne ka
  SessionController._internal() {
    isLogin = false;
  }

  // ye singleton ke liye create kiye h
  factory SessionController() {
    return _session;
  }
// fun. for saveUserInPreference
  // function bna kr user ka model bnaye h
  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    // Storing value to check login
    localStorage.setValue('isLogin', 'true');
  }
// fun. for getuserFromPreference
Future<void> getUserFromPreference() async {
    try {

      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');

      // condition lgye h agr user ka data not empty h to .....
      if(userData.isNotEmpty){
        SessionController().user  = UserModel.fromJson(jsonDecode(userData));

      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
}


}
