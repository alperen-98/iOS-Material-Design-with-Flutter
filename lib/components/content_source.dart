import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/utilities/constants.dart';
import 'package:fruits_app/utilities/functions.dart';

class ContentSource extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: kBorderRadius12,
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: const Text(
                'Content Source',
                style: kContentSourceTextStyle,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  InkWell(
                    child: const Text(
                      'Wikipedia',
                      style: kContentSourceTextStyle,
                    ),
                    onTap: () async {
                      launchURL(wikipediaURL);
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(CupertinoIcons.arrow_up_right_square),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
