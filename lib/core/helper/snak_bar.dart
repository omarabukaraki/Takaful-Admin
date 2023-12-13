import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

void showSankBar(BuildContext context, String message,
    {Color color = AppColor.kRed}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      textDirection: TextDirection.rtl,
    ),
    backgroundColor: color,
  ));
}
