import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takaful_admin1/core/helper/snak_bar.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_button.dart';
import 'package:takaful_admin1/core/widget/custom_text_field.dart';
import 'package:takaful_admin1/core/widget/logo_takaful.dart';
import 'package:takaful_admin1/features/auth/presentation/login_cubit/login_cubit.dart';
import 'package:takaful_admin1/features/home/presentation/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoding = false;

  void clearText() {
    email.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginLodging) {
        isLoding = true;
      } else if (state is LoginSuccess) {
        isLoding = false;
        clearText();

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ));
      } else if (state is LoginFailure) {
        isLoding = false;
        showSankBar(context, state.errMessage);
      }
    }, builder: (context, state) {
      return BlurryModalProgressHUD(
        inAsyncCall: isLoding,
        progressIndicator:
            const SpinKitFadingCircle(color: AppColor.kPrimary, size: 90.0),
        dismissible: false,
        opacity: 0.4,
        child: Scaffold(
          body: Form(
            key: formKey,
            child: ListView(
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
                CustomTextFiled(
                  hintText: AppString.textEmailArabic,
                  onChanged: (emailAddress) {
                    email.text = emailAddress;
                  },
                ),
                CustomTextFiled(
                  typeText: true,
                  hintText: AppString.textPasswordArabic,
                  onChanged: (userPassword) {
                    password.text = userPassword;
                  },
                ),
                CustomButton(
                  text: AppString.textSginINArabic,
                  color: AppColor.kPrimary,
                  textColor: AppColor.kTextFiled,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context)
                          .signIn(email: email.text, password: password.text);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
