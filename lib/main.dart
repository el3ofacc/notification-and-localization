import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notification/components/applocal.dart';
import 'package:notification/dataprovider.dart';
import 'package:notification/homepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize("resource://drawable/images", [
    NotificationChannel(
        channelKey: "channelKey",
        playSound: true,
        channelName: "channelName",
        channelDescription: "channelDescription")
  ]);
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Dataprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [Locale('ar', ""), Locale('en', "")],
        locale: Locale('en'),
        localeResolutionCallback: (currentlang, supportedlang) {
          if (currentlang != null) {
            for (Locale locale in supportedlang) {
              if (locale.languageCode == currentlang.languageCode) {
                return currentlang;
              }
            }
          }
          return supportedlang.first;
        },
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:notification/dataprovider.dart';
import 'package:notification/homepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Dataprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Homepage(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', ""),
          Locale('en', ""),
        ],
        localeListResolutionCallback: (currentLang, supportedLang) {
          if (currentLang != null) {
            for (Locale userLocale in currentLang) {
              if (supportedLang.contains(userLocale)) {
                return userLocale;
              }
            }
          }
          return supportedLang.first;
        },
      ),
    );
  }
}

*/