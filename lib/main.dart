import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/nav_provider.dart';
import 'routing/router.dart';
import 'services/service_locator.dart';
import 'splash_app.dart';

Future<void> main() async {
  launchApp();
}

void launchApp() {
  //Set up States as dependencies
  setupLocator();

  //setPathUrlStrategy();
  runApp(
    SplashApp(
        key: UniqueKey(),
        onInitializationComplete: () => runApp(createTribesApp())),
  );
}

Widget createTribesApp() => ChangeNotifierProvider<NavProvider>(
      create: (final BuildContext context) => NavProvider(globalNavigationTabs),
      child: MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Routing 2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: locator<AppRouterDelegate>(),
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}
