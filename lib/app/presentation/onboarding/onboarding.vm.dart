import 'package:injectable/injectable.dart';
import 'package:pomotracker/app/model/app_settings.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';

@injectable
class OnboardingViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  OnboardingViewModel(this._localDataSource);
  int _currentPage = 1;
  int get currentPage => _currentPage;
  void setcurrentPage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Future setOnBoarded() async {
    var appSettings = await _localDataSource.appSettings;
    if (appSettings == null) {
      appSettings = ApplicationSettings(onBoarded: true);
    } else {
      appSettings = appSettings.copyWith(onBoarded: true);
    }
    await _localDataSource.setAppSettings(appSettings);
  }
}
