import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/components/settings_header.dart';
import 'package:fruits_app/components/toggle_box.dart';
import 'package:fruits_app/providers/theme_provider.dart';
import 'package:fruits_app/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'app_info.dart';

Widget _popupBody(context) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: kSettingsPaddingContent,
            decoration: BoxDecoration(
              borderRadius: kBorderRadius12,
              color: Theme.of(context).backgroundColor,
            ),
            child: Column(
              children: [
                SettingsHeader(
                  title: 'CUSTOMIZATION',
                  iconData: CupertinoIcons.paintbrush,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 10),
                  child: const Text(
                    'If you wish you can customize the application by toggling the switches in these boxes.',
                  ),
                ),
                ToggleBoxes(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: kSettingsPaddingContent, // padding for texts
            decoration: BoxDecoration(
              borderRadius: kBorderRadius12,
              color: Theme.of(context).backgroundColor,
            ),
            child: AppInfo(),
          ),
        ],
      ),
    ),
  );
}

showPopUp(context) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return context.watch<ThemeProvider>().isIOSPlatform
          ? Scaffold(
              body: Container(
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      CupertinoSliverNavigationBar(
                        backgroundColor:
                            Theme.of(context).appBarTheme.backgroundColor,
                        largeTitle: Text(
                          'Settings',
                          style: appBarTitleStyle(context),
                        ),
                        automaticallyImplyLeading: false,
                        trailing: IconButton(
                          icon: const Icon(CupertinoIcons.clear),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ];
                  },
                  body: _popupBody(context),
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).backgroundColor,
                title: Text(
                  'Settings',
                  style: appBarTitleStyle(context),
                ),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.clear,
                      color: adaptiveIconColor(context),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              body: _popupBody(context),
            );
    },
  );
}
