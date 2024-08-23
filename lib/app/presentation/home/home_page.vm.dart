import 'package:injectable/injectable.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  HomeViewModel(this._localDataSource);

  bool _isAddingTask = false;
  bool get isAddingTask => _isAddingTask;
  void toggleAddingTask() {
    _isAddingTask = !isAddingTask;
    notifyListeners();
  }

  int? _taskCount;
  int? get taskCount => _taskCount;
  void settaskCount(int? taskCount) {
    _taskCount = taskCount;
    notifyListeners();
  }
}
