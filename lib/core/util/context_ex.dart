//Build context extension for l10n
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension l10n on BuildContext {
  AppLocalizations get appLocalizations => AppLocalizations.of(this);
}
