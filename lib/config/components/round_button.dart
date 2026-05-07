import 'package:bloc_clean/config/color/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  // title ko dynamic bnyenge kyuki yh title ki value user dega  mtlb ki jis page pe hm es widget ko use krenge  vha denge hm ki es button ka nam ky rhega and work ky rhega
  final String title;
  // button p click krne p kya hoga
  final VoidCallback onPress;
  // title ur button work ko requrired krenge , requried v kr skte h ur value v de skte h
  final double height;
  const RoundButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // click krne pe onPress ka data lega
      onTap: onPress,
      child: Container(
        height: 40,
        decoration: BoxDecoration(color: AppColors.buttonColor),
        child: Center(child: Text(title)),
      ),
    );
  }
}
