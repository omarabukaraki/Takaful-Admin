import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_button.dart';
import 'package:takaful_admin1/core/widget/custom_text_field.dart';

class SendMessagePage extends StatelessWidget {
  const SendMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        children: [
          const Text(
            AppString.textNotiDetails,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 24, color: AppColor.kPrimary, height: 3),
          ),
          const CustomTextFiled(
            hintText: AppString.textNotiTitle,
            horizontalPadding: double.infinity,
          ),
          const CustomTextFiled(
            hintText: AppString.textNotiDescription,
            horizontalPadding: double.infinity,
            maxLines: 12,
          ),
          CustomButton(
            color: AppColor.kPrimary,
            textColor: AppColor.kWhite,
            text: AppString.textSendNoti,
            horizontalPadding: double.infinity,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
