import 'package:base_ui_flutter_example/commom/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'assets/app_icons.dart';

class AppNavigationWidget extends StatelessWidget {
  const AppNavigationWidget({this.title, this.bgColor,Key? key})
      : super(key: key);

  final String? title;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      color: bgColor,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AppText.primary(
            title ?? '',
            fontSize: 18.sp,
          ),
          Positioned(right: 30.w, child: AppIcons.iconMenu.widget())
        ],
      ),
    );
  }
}