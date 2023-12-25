import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

import '../../../../../core/utils/app_strings.dart';

AwesomeDialog customDeleteDialog({
  required BuildContext context,
  required String dialogBody,
  required void Function()? btnOkOnPress,
}) {
  return AwesomeDialog(
      autoDismiss: true,
      width: 400,
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.error,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            dialogBody,
          ),
        ),
      ),
      btnOkText: AppString.textDelete,
      btnCancelText: AppString.textCancellation,
      btnOkColor: AppColor.kRed,
      btnCancelColor: AppColor.kPrimary,
      btnOkOnPress: btnOkOnPress,
      btnCancelOnPress: () {});
}
