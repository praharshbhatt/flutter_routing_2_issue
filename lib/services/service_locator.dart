import 'package:get_it/get_it.dart';

import '../routing/router.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  //Navigation
  locator.registerLazySingleton(() => AppRouterDelegate());
}

///Unregisters all of the dependencies
///Make sure that all are initialized, or this can potentially break the app
///TODO: Try and make locator.isRegistered() work
void unregisterAll() {
  locator.unregister<AppRouterDelegate>();
}
