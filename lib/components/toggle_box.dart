import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ToggleBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleBox(
          title: 'DARK MODE',
          toggleValue: Provider.of<ThemeProvider>(context).isDarkTheme,
          onSwitch: () async {
            context.read<ThemeProvider>().toggleTheme();
          },
        ),
        const SizedBox(
          height: 10,
        ),
        ToggleBox(
          title: 'iOS THEME',
          toggleValue: context.watch<ThemeProvider>().isIOSPlatform,
          onSwitch: () {
            context.read<ThemeProvider>().togglePlatform();
          },
        ),
      ],
    );
  }
}

class ToggleBox extends StatelessWidget {
  ToggleBox(
      {required this.title, required this.toggleValue, required this.onSwitch});
  final String title;
  final bool toggleValue;
  final Function onSwitch;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).selectedRowColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          context.watch<ThemeProvider>().isIOSPlatform
              ? CupertinoSwitch(
                  value: toggleValue,
                  onChanged: (_) {
                    onSwitch();
                  },
                )
              : Switch(
                  value: toggleValue,
                  onChanged: (_) {
                    onSwitch();
                  },
                ),
        ],
      ),
    );
  }
}
