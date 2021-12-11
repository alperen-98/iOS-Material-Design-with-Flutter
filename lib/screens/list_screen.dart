import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/components/fruit_card.dart';
import 'package:fruits_app/components/settings_button.dart';
import 'package:fruits_app/providers/theme_provider.dart';
import 'package:fruits_app/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:fruits_app/data/fruit_data.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildBody() {
      return SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: kBorderRadius12,
            ),
            padding: const EdgeInsets.all(15),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: fruits.length,
              itemBuilder: (context, i) {
                return FruitCard(fruit: fruits[i]);
              },
              separatorBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: const Divider(
                    thickness: 0.7,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    return context.watch<ThemeProvider>().isIOSPlatform
        ? Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  CupertinoSliverNavigationBar(
                    backgroundColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                    largeTitle: Text(
                      'Fruits',
                      style: appBarTitleStyle(context),
                    ),
                    trailing: SettingsButton(),
                  ),
                ];
              },
              body: buildBody(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).backgroundColor,
              title: Text(
                'Fruits',
                style: appBarTitleStyle(context),
              ),
              actions: [
                SettingsButton(),
              ],
            ),
            body: buildBody(),
          );
  }
}
