import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/providers/theme_provider.dart';
import 'package:fruits_app/screens/list_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            isDarkMode: _prefs.getBool('isDarkTheme') ?? false,
            isIOSPlatform: _prefs.getBool('isIOSPlatform') ?? Platform.isIOS,
          ),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().isDarkTheme
          ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black,
              backgroundColor: CupertinoColors.systemFill,
              selectedRowColor: Colors.grey[850],
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.black54,
              ),
            )
          : ThemeData.light().copyWith(
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor:
                    CupertinoColors.extraLightBackgroundGray.withOpacity(0.6),
              ),
              backgroundColor: CupertinoColors.extraLightBackgroundGray,
              selectedRowColor: Colors.white70,
            ),
      home: ListScreen(),
    );
  }
}
