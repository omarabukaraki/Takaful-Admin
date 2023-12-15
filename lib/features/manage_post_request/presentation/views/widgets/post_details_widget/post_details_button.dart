import 'package:flutter/material.dart';

class PostDetailsButton extends StatelessWidget {
  const PostDetailsButton({
    super.key,
    this.circular,
    this.color,
    this.textColor,
    required this.text,
    required this.onTap,
  });
  final Color? color;
  final Color? textColor;
  final String text;
  final VoidCallback onTap;
  final double? circular;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
            // border: Border.all(color: AppColor.kPrimary, width: 5),
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
    );
  }
}
