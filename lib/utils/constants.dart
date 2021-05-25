import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String API_URL = 'https://abezz.dreamhosters.com//wp-json/wp/v2';
const String ck = 'ck_957275737a5286dc7200af75af055954ec56126a';
const String cs = 'cs_9a9f07809616e45c0bc04ae3ea57892ee692977d';

var authKey = 'Basic ' + base64Encode(utf8.encode('$ck:$cs'));
var authKeyPostman = 'Basic Y2tfOTU3Mjc1NzM3YTUyODZkYzcyMDBhZjc1YWYwNTU5NTRlYzU2MTI2YTpjc185YTlmMDc4MDk2MTZlNDVjMGJjMDRhZTNlYTU3ODkyZWU2OTI5Nzdk';

Map env = {
  "serverConfig": {
    'type': 'woo',
    'url': 'https://fastkood.net/ecommerce/',
    'consumerKey': 'ck_800a2f5875979a2234023ceeeb69e83f94c5bcc5',
    'consumerSecret': 'cs_642a9b2b82cf8268910fbc63c783b6bab32a27ad',
    'blog':
        'https://fastkood.net/ecommerce/', //Your website woocommerce. You can remove this line if it same url
    /// remove to use as native screen
    'forgetPassword':
        'https://fastkood.net/ecommerce/wp-login.php?action=lostpassword'
  },
};

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
