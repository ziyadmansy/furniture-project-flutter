import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const Color mainColor = Colors.teal;
final Color redColor = Colors.red[600];
final Color greenColor = Colors.greenAccent[700];

const double kBorderRadius = 12.0;

const String INTERNET_WARNING_MESSAGE =
    'Check your internet connection then try again.';

const kappBarTextStyle = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const kappBarIconTheme = IconThemeData(
  color: Colors.grey,
);

const appLoader = SpinKitDoubleBounce(
  color: mainColor,
  size: 40.0,
);

final kEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: BorderSide(
    width: 1,
    color: Colors.grey,
  ),
);

final kFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: BorderSide(
    width: 2,
    color: mainColor,
  ),
);
