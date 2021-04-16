import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color btnTextColor;
  final IconData btnIcon;
  final void Function() onBtnPressed;

  const FullWidthButton({
    @required this.btnText,
    @required this.btnColor,
    @required this.btnTextColor,
    @required this.btnIcon,
    @required this.onBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: RaisedButton.icon(
        label: Text(btnText),
        textColor: btnTextColor,
        icon: Icon(btnIcon),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: btnColor,
        onPressed: onBtnPressed,
      ),
    );
  }
}