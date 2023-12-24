import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

AwesomeDialog customDeleteDialog({
  required BuildContext context,
  required String dialogBody,
  // required void Function(DismissType)? onDismissCallback,
  //required DialogType dialogType
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
      btnOkText: 'حذف',
      btnCancelText: 'إالغاء',
      // onDismissCallback: onDismissCallback,
      btnOkColor: AppColor.kRed,
      btnCancelColor: AppColor.kPrimary,
      // ignore: avoid_print
      btnOkOnPress: btnOkOnPress,
      btnCancelOnPress: () {});
}
