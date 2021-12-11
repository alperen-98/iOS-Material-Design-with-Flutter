import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/components/settings_header.dart';
import 'package:fruits_app/utilities/constants.dart';
import 'package:fruits_app/utilities/functions.dart';

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsHeader(title: 'APPLICATION', iconData: Icons.phone_iphone),
        _InfoField(title: 'Developer', data: 'Alperen Kıldır'),
        _InfoField(title: 'Designer', data: 'Robert Petras'),
        _InfoFieldWithLink(
          title: 'GitHub',
          data: '@alperen-98',
          goToUrl: myGitHubProfileURL,
        ),
        _InfoFieldWithLink(
          title: 'Twitter',
          data: '@oiworlditsme',
          goToUrl: myTwitterProfileURL,
        ),
        _InfoField(title: 'Compatibility', data: "iOS 9+"),
        _InfoField(title: 'Flutter', data: '2.8.0'),
        _InfoField(title: 'Version', data: '1.0.0'),
      ],
    );
  }
}

class _InfoFieldWithLink extends StatelessWidget {
  const _InfoFieldWithLink(
      {required this.title, required this.data, required this.goToUrl});
  final String title;
  final String data;
  final String goToUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: kInfoTitleTextStyle,
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      data,
                      textAlign: TextAlign.end,
                      style: kInfoDataTextStyle,
                    ),
                    onTap: () async {
                      launchURL(goToUrl);
                    },
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Icon(
                    CupertinoIcons.arrow_up_right_square,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          height: 20,
        ),
      ],
    );
  }
}

class _InfoField extends StatelessWidget {
  _InfoField({required this.title, required this.data});
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: kInfoTitleTextStyle,
              ),
            ),
            //const Spacer(),
            Expanded(
              child: Text(
                data,
                textAlign: TextAlign.end,
                style: kInfoDataTextStyle,
              ),
            ),
          ],
        ),
        const Divider(
          height: 20,
        ),
      ],
    );
  }
}
