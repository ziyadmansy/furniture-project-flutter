import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void errorDialog({
   BuildContext context,
  VoidCallback onConfirm,
   String title,
  String body = '',
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    animType: AnimType.SCALE,
    title: title,
    desc: body,
    btnOkOnPress: onConfirm ?? () {},
  ).show();
}

void successDialog({
   BuildContext context,
  VoidCallback onConfirm,
   String title,
  String body,
  String confirmBtnText = 'OK',
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.SCALE,
    title: title,
    desc: body,
    btnOkOnPress: onConfirm ?? () {},
    btnOkText: confirmBtnText,
  ).show();
}

void warningDialog({
   BuildContext context,
  VoidCallback onConfirm,
   String title,
  String body,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.WARNING,
    animType: AnimType.SCALE,
    title: title,
    desc: body,
    btnOkOnPress: onConfirm ?? () {},
  ).show();
}

// void loadingDialog({
//   required BuildContext context,
//   VoidCallback? onConfirm,
//   required String title,
//   String? body,
//   bool dismissable = true,
// }) {
//   // CoolAlert.show(
//   //   context: context,
//   //   type: CoolAlertType.loading,
//   //   title: title,
//   //   text: body,
//   //   onConfirmBtnTap: onConfirm,
//   //   barrierDismissible: dismissable,
//   // );
// }