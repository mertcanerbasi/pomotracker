// Flutter imports:
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

// Project imports:

@module
abstract class AppModule {
  @Environment(Environment.prod)
  @Environment(Environment.dev)
  @Order(-1001)
  @preResolve
  Future<GetStorage> get storage async {
    await GetStorage.init("MyStorage");
    return GetStorage("MyStorage");
  }
}
