import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color btnTextColor;
  final void Function() btnPressed;

  const RoundedRectangleButton({
    this.btnText,
    this.btnColor,
    this.btnTextColor,
    this.btnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.25,
      height: 48,
      child: RaisedButton(
        child: Text(
          btnText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        color: btnColor,
        textColor: btnTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: btnPressed,
      ),
    );
  }
}
