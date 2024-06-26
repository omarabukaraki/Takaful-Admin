import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

class CustomWarningComponent extends StatelessWidget {
  const CustomWarningComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.warning_amber_rounded, size: 100, color: AppColor.kPrimary),
        Text(
          'لا يوجد نتيجة للبحث ',
          style: TextStyle(color: AppColor.kFont, fontSize: 24),
        )
      ],
    ));
  }
}
