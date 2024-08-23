import 'package:injectable/injectable.dart';
import 'package:pomotracker/core/base/base_view_model.dart';

@injectable
class OnboardingViewModel extends BaseViewModel {
  int _currentPage = 1;
  int get currentPage => _currentPage;
  void setcurrentPage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
