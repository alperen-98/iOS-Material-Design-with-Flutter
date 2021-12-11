import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  SettingsHeader({required this.title, required this.iconData});
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Icon(iconData),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
