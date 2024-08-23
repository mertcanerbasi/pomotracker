// Package imports:
import 'package:get_it/get_it.dart';
import 'package:pomotracker/core/di/locator.config.dart';
import 'package:injectable/injectable.dart';

// Project imports:

GetIt getIt = GetIt.instance;
@InjectableInit()
Future setupDI(String environment) => getIt.init(environment: environment);
