import 'package:injectable/injectable.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';

@injectable
class SettingsViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  SettingsViewModel(this._localDataSource);
}
