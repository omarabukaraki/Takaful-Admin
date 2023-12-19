import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

class TitleAddCategoryPage extends StatelessWidget {
  const TitleAddCategoryPage({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'الوصف',
      style: const TextStyle(
        fontSize: 32,
        color: AppColor.kFont,
        fontWeight: FontWeight.w300,
      ),
      maxLines: 1,
    );
  }
}
