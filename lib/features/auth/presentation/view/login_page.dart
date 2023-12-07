import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_button.dart';
import 'package:takaful_admin1/core/widget/custom_text_field.dart';
import 'package:takaful_admin1/core/widget/logo_takaful.dart';
import 'package:takaful_admin1/features/home/presentation/view/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 75,
          ),
          const LogoTakaful(),
          const Text(
            AppString.textLoginArabic,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 32,
                color: AppColor.kPrimary,
                fontWeight: FontWeight.w400),
          ),
          const Text(
            AppString.textAddDetailsToLogin,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: AppColor.kFontSecondary,
                fontWeight: FontWeight.w500,
                height: 1.4285714285714286),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextFiled(hintText: AppString.textEmailArabic),
          const CustomTextFiled(hintText: AppString.textPasswordArabic),
          CustomButton(
            text: AppString.textSginINArabic,
            color: AppColor.kPrimary,
            textColor: AppColor.kTextFiled,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
          )
        ],
      ),
    );
  }
}
