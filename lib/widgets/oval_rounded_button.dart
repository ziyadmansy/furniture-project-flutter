import 'package:flutter/material.dart';

class OvalRoundedButton extends StatelessWidget {
  final Color btnColor;
  final String btnText;
  final Function onBtnPressed;
  final Color borderColor;

  const OvalRoundedButton({
    this.btnColor,
    this.btnText,
    this.onBtnPressed,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 48,
      child: RaisedButton(
        color: btnColor,
        child: Text(btnText),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: borderColor ?? Colors.black,
          ),
        ),
        textColor: Colors.white,
        onPressed: onBtnPressed,
      ),
    );
  }
}
