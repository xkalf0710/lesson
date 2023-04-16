import 'package:lesson/services/navigator_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void locatorSetup() {
  locator.registerLazySingleton(() => NavigatorService());
}