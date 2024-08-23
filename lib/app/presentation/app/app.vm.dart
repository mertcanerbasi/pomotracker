// Package imports:

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';
import 'package:pomotracker/core/res/app_constants.dart';

@Singleton()
class AppViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  AppViewModel(
    this._localDataSource,
  );
  final GlobalKey<NavigatorState> _mainNavigatorKey =
      GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get mainNavigatorKey => _mainNavigatorKey;

  String get platformLocale {
    if (_localDataSource.languageCode == null) {
      if (AppConstants.supportedLanguages
          .contains(Platform.localeName.split('_')[0].toUpperCase())) {
        return Platform.localeName;
      } else {
        return "en";
      }
    } else {
      return _localDataSource.languageCode!;
    }
  }
}
