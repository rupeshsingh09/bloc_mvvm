import 'dart:io';

import 'package:bloc_clean/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  // size ko dynamic bnyenge
  final double size;
  // fixed size 60 rhega
  const LoadingWidget({Key? key, this.size = 60}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {

  // user model jo bnaye te vh use kr rhe h yhaa
  UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height , width ke upr bnye h  vhi call kiye
      height: widget.size,
      width: widget.size,
      // condition lgayenge ki platform android h ya iphone to uske hisab se indicator show hoga
      child: Platform.isAndroid ?  const CircularProgressIndicator(
        color: Colors.blue,
      ) : const CupertinoActivityIndicator(
        color: Colors.red,
      )
    );
  }
}
