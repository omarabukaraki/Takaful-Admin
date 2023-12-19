import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/core/utils/app_strings.dart';
import 'package:takaful_admin1/core/widget/custom_button.dart';
import 'package:takaful_admin1/core/widget/custom_text_field.dart';

import '../cubit/send_notification_cubit.dart';

class SendNotificationPage extends StatefulWidget {
  const SendNotificationPage({super.key});

  @override
  State<SendNotificationPage> createState() => _SendNotificationPageState();
}

class _SendNotificationPageState extends State<SendNotificationPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleNotification = TextEditingController();
  final TextEditingController bodyNotification = TextEditingController();

  void clearTextController() {
    titleNotification.clear();
    bodyNotification.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          children: [
            const Text(
              AppString.textNotiDetails,
              textAlign: TextAlign.end,
              style:
                  TextStyle(fontSize: 24, color: AppColor.kPrimary, height: 3),
            ),
            CustomTextFiled(
              controller: titleNotification,
              hintText: AppString.textNotiTitle,
              horizontalPadding: double.infinity,
              onChanged: (value) {
                titleNotification.text = value;
              },
            ),
            CustomTextFiled(
              controller: bodyNotification,
              paddingVertical: 20,
              hintText: AppString.textNotiDescription,
              horizontalPadding: double.infinity,
              maxLines: 12,
              onChanged: (value) {
                bodyNotification.text = value;
              },
            ),
            CustomButton(
              color: AppColor.kPrimary,
              textColor: AppColor.kWhite,
              text: AppString.textSendNoti,
              horizontalPadding: double.infinity,
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  await BlocProvider.of<SendNotificationCubit>(context)
                      .addNotification(
                          titleNotification: titleNotification.text,
                          bodyNotification: bodyNotification.text);
                  clearTextController();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
