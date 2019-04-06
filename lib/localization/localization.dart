import 'dart:ui';

import 'package:flutter/material.dart';

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'click_title': 'You have clicked the button',
    },
    'ro': {
      'click_title': 'Ai apasat butonul de',
    },
  };

  String get clickTitle {
    return _localizedValues[locale.languageCode]['click_title'];
  }
}