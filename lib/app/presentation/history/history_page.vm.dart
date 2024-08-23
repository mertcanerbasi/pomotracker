import 'package:injectable/injectable.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';

@injectable
class HistoryViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  HistoryViewModel(this._localDataSource);
}
