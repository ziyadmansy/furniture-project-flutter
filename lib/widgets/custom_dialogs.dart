import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/utils/constants.dart';

class Dialogs {
  void errorDialog({
    BuildContext context,
    Function onConfirm,
    String title,
    String body,
  }) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: title,
      text: body,
      confirmBtnText: 'Ok',
      onConfirmBtnTap: onConfirm,
      backgroundColor: mainColor,
    );
  }

  void successDialog({
    BuildContext context,
    String title,
    String body,
    Function onConfirm,
    String confirmBtnText = 'OK',
  }) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title: title,
      text: body,
      confirmBtnText: confirmBtnText,
      onConfirmBtnTap: onConfirm,
      backgroundColor: mainColor,
    );
  }

  void loadingDialog({
    BuildContext context,
    String title,
    String body,
    Function onConfirm,
    bool dismissable,
  }) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
      title: title,
      text: body,
      onConfirmBtnTap: onConfirm,
      backgroundColor: mainColor,
      barrierDismissible: dismissable,
    );
  }

  void warningDialog({
    BuildContext context,
    String title,
    String body,
    Function onConfirm,
  }) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      title: title,
      text: body,
      confirmBtnText: 'Ok',
      onConfirmBtnTap: onConfirm,
      backgroundColor: mainColor,
    );
  }
}
