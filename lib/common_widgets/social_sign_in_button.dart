import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1/common_widgets/sign_in_button.dart';

import 'custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(assetName),
        Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0)
        ),
        Opacity(
          opacity: 0.0,
          child: Image.asset(assetName),
        )
      ],
    ),
    color: color,
    onPressed: onPressed,
  );
}