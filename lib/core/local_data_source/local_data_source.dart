// ignore_for_file: unused_field
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
  Future<void> clear();
  Future setLanguageCode(String language);
  String? get languageCode;
  Future setOnBoarded(bool value);
  bool get onBoarded;
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@Order(-1000)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final GetStorage _getStorage;
  LocalDataSourceImpl(this._getStorage);

  @override
  Future<void> clear() async {
    _getStorage.erase();
    return;
  }

  @override
  String? get languageCode => _getStorage.read("language");

  @override
  Future setLanguageCode(String language) async {
    return await _getStorage.write("language", language);
  }

  @override
  bool get onBoarded => _getStorage.read("onBoarded") ?? false;

  @override
  Future setOnBoarded(bool value) {
    return _getStorage.write("onBoarded", value);
  }
}
