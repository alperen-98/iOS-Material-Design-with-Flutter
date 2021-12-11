import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/components/settings_pop_up.dart';
import 'package:fruits_app/utilities/constants.dart';

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        CupertinoIcons.slider_horizontal_3,
        color: adaptiveIconColor(context),
      ),
      onPressed: () {
        showPopUp(context);
      },
    );
  }
}
