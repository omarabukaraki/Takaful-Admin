import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.circular,
      this.color,
      this.textColor,
      required this.text,
      required this.onTap,
      this.horizontalPadding = 5});
  final Color? color;
  final Color? textColor;
  final String text;
  final VoidCallback onTap;
  final double? circular;
  final double horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / horizontalPadding,
          vertical: 10,
        ),
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.kPrimary),
              borderRadius: BorderRadius.circular(20),
              color: color),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
