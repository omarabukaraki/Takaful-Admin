import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';

AwesomeDialog customDialog(
    {required BuildContext context,
    required String dialogBody,
    required void Function(DismissType)? onDismissCallback,
    required DialogType dialogType}) {
  return AwesomeDialog(
    autoDismiss: true,
    width: 400,
    context: context,
    animType: AnimType.scale,
    dialogType: dialogType,
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          dialogBody,
        ),
      ),
    ),
    btnOkText: 'تم',
    title: '',
    desc: '',
    onDismissCallback: onDismissCallback,
    btnOkColor:
        dialogType == DialogType.success ? AppColor.kGreen : AppColor.kRed,
    // ignore: avoid_print
    btnOkOnPress: () {
      print('');
    },
  );
}
