import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      this.hintText,
      this.onChanged,
      this.typeText = false,
      this.icon,
      this.typeKeyboardNumber,
      this.controller,
      this.maxLines = 1});
  final String? hintText;
  final Function(String)? onChanged;
  final bool typeText;
  final Icon? icon;
  final bool? typeKeyboardNumber;
  final TextEditingController? controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: TextFormField(
        // ignore: body_might_complete_normally_nullable
        validator: (data) {
          if (data!.isEmpty) {
            return 'الحقل مطلوب'.padLeft(86);
          }
        },

        keyboardType: typeKeyboardNumber == true
            ? TextInputType.number
            : TextInputType.text,
        obscureText: typeText,
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.end,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(24),
          suffixIcon: icon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColor.kTextFiledFont,
            fontSize: 20,
          ),
          filled: true,
          fillColor: AppColor.kTextFiled,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
