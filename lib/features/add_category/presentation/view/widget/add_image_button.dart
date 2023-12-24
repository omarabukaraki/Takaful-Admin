import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key, this.icon, this.text, required this.onTap});
  final IconData? icon;
  final String? text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
            // horizontal: 10,
            vertical: 10),
        width: double.infinity,
        // height: 164,
        decoration: BoxDecoration(
            color: AppColor.kPrimary, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.check,
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Text(
              text ?? 'تم اضافة الصور بنجاح',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
