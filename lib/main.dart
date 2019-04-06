import 'package:flutter/material.dart';
import 'package:flutter_app/localization/demo_localization_delegate.dart';
import 'package:flutter_app/localization/localization.dart';
import 'package:flutter_app/network_manager.dart';
import 'package:flutter_app/person.dart';
import 'package:flutter_app/tasks/contact_list.dart';
import 'package:flutter_app/tasks/contact_list_tile.dart';
import 'package:flutter_app/tasks/contact_profile.dart';
import 'package:flutter_app/tasks/contact_profile_details.dart';
import 'package:flutter_app/tasks/orange_bg_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/tasks/generated_example_prefs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const DemoLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ro', ''),
      ],
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.cyan,
          textTheme: TextTheme(
            body1: TextStyle(
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          )),
        home: FirstExample(title: ""),
//          home: ListOfOrangeBgTextWidget(),
//        home: ContactProfile("", ""),
//          home: ContactListTile(title: ""),
//        home: ContactList(title: 'Flutter Demo Home Page',),
    );
  }
}