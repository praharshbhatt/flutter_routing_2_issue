import 'package:flutter/material.dart';

import '../pages/unknown_page.dart';
import 'app_route_path.dart';
import 'route_names.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  ///Converts the given route information into parsed data to pass to a RouterDelegate.
  /// The method should return a future which completes when the parsing is complete. The parsing may be asynchronous if, e.g., the parser needs to communicate with the OEM thread to obtain additional data about the route.
  /// Consider using a SynchronousFuture if the result can be computed synchronously, so that the Router does not need to wait for the next microtask to pass the data to the RouterDelegate.
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInfo) async {
    final uri = Uri.parse(routeInfo.location!);

    /// Handle routes
    /// Handle the Lowest level routes
    if (uri.pathSegments.isEmpty) {
      // Handle '/'
      return AppRoutePath.simpleScreen(RouteNames.discoverTabRoute);
    } else if (uri.pathSegments.length == 1) {
      // Handle the parameter less screens like
      // '/discover', '/tribes', '/music', '/movements'
      String url = uri.pathSegments.first;
      if (!url.startsWith('/')) '/$url';
      return AppRoutePath.simpleScreen(url);
    } else if (uri.pathSegments.length == 2) {
      // Handle Screens with query parameters
      String url = uri.pathSegments.first;
      if (!url.startsWith('/')) '/$url';
      return AppRoutePath.parameterScreen(url, uri.pathSegments[1]);
    } else {
      // Handle unknown routes
      String url = routeInfo.location!;
      if (!url.startsWith('/')) '/$url';
      return AppRoutePath.simpleScreen('/${routeInfo.location!}');
    }
  }

  // which is used for updating browser history for the web application.
  // If you decide to opt in, you must also overrides this method
  // to return a route information.
  @override
  RouteInformation restoreRouteInformation(AppRoutePath path) {
    return RouteInformation(location: path.pathWithQuery);
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late AppRoutePath appRoutePath = AppRoutePath.simpleScreen(RouteNames.discoverTabRoute);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,

      ///Page Stack
      pages: _getPageStack(),

      ///When the back button is pressed
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        final uri = Uri.parse(appRoutePath.pathWithQuery);
        if (uri.pathSegments.isNotEmpty) {
          String lastPage = uri.pathSegments.last;
          if (!lastPage.startsWith('/')) lastPage = '/$lastPage';
          String secondLastPage =
              uri.pathSegments.length > 1 ? uri.pathSegments[uri.pathSegments.length - 2] : '';
          if (!secondLastPage.startsWith('/')) secondLastPage = '/$secondLastPage';

          if (RouteNames().availablePages.contains(lastPage)) {
            String prevUrl = appRoutePath.pathWithQuery;
            prevUrl = prevUrl.substring(0, prevUrl.lastIndexOf('/'));
            appRoutePath = AppRoutePath.simpleScreen('/$prevUrl');
          } else if (RouteNames().mandatoryParameterPages.contains(secondLastPage)) {
            String prevUrl = appRoutePath.pathWithQuery;
            prevUrl = prevUrl.substring(0, prevUrl.lastIndexOf('/'));
            prevUrl = prevUrl.substring(0, prevUrl.lastIndexOf('/'));
            if (prevUrl.isEmpty || prevUrl.substring(0, 1) != '/') prevUrl = '/$prevUrl';
            appRoutePath = AppRoutePath.simpleScreen(prevUrl);
          }
        }
        notifyListeners();

        return true;
      },
    );
  }

  // show the correct path in the url, need to return
  // route path based on current state of the app
  @override
  AppRoutePath get currentConfiguration => appRoutePath;

  // when update of route, updates the app state
  // This can be done through updating the app url
  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration.isUnknown) {
      appRoutePath = configuration;
      return;
    }

    appRoutePath = AppRoutePath.parameterScreen(
      configuration.routeName,
      Uri.parse(configuration.pathWithQuery).pathSegments.length > 1
          ? Uri.parse(configuration.pathWithQuery).pathSegments[1]
          : null,
    );
    return;
  }

  List<Page<dynamic>> _getPageStack() {
    final List<Page<dynamic>> pageStack = [];
    //Check for the lowest Tab pages
    final uri = Uri.parse(appRoutePath.pathWithQuery);
    String? prevPathSegment;
    String? lastParameter;
    uri.pathSegments.forEach((String query) {
      if (query == '') return;
      if (RouteNames().availablePages.contains('/$query')) {
        // The path exists. Now check if this path
        // 1. Requires a parameter
        // 2. Requires a parameter from the parent
        // 3. Does not requires any parameter
        if (RouteNames().mandatoryParameterPages.contains('/$query')) {
          //Requires parameter
          prevPathSegment = query;
        } else if (RouteNames().parentParameterPages.contains('/$query')) {
          //Requires parameter from the parent
          if (lastParameter != null && lastParameter != '') {
            pageStack.add(RouteNames().getPageFromRouteName('/$query', parameter1: lastParameter));
          }
        } else {
          //Does not require require
          pageStack.add(RouteNames().getPageFromRouteName('/$query'));
        }
      } else if (prevPathSegment != null) {
        // The Page in the iteration before needed a parameter, and this is the parameter needed

        if (RouteNames().parentParameterPages.contains('/$prevPathSegment')) {
          //This page also needs Requires parameter from the parent
          if (lastParameter != null && lastParameter != '') {
            pageStack.add(
              RouteNames().getPageFromRouteName(
                '/$prevPathSegment',
                parameter1: lastParameter,
                parameter2: query,
              ),
            );
          }
        } else {
          pageStack.add(RouteNames().getPageFromRouteName('/$prevPathSegment', parameter1: query));
        }
        lastParameter = query;
        prevPathSegment = null;
      } else {
        //If the path does not exist, return the user to 404
        pageStack.add(UnknownPage());
      }
    });
    //Finally, check if the stack at the bottom is Home page
    if (pageStack.isEmpty ||
        pageStack.first.key != const ValueKey(RouteNames.discoverTabRoute) &&
            pageStack.first.key != const ValueKey(RouteNames.tribesTabRoute) &&
            pageStack.first.key != const ValueKey(RouteNames.musicTabRoute) &&
            pageStack.first.key != const ValueKey(RouteNames.movementsTabRoute)) {
      pageStack.insert(0, RouteNames().getPageFromRouteName(RouteNames.discoverTabRoute));
    }
    return pageStack;
  }

  ///Handling Pages with parameters open
  void goToDetailsPage(String routeName, String? parameter) {
    appRoutePath = AppRoutePath.parameterScreen(
      routeName,
      parameter,
    );
    notifyListeners();
  }

  ///Handling simple page open
  void goToSimplePage(String simplePageRoute) {
    appRoutePath = AppRoutePath.simpleScreen(simplePageRoute);
    notifyListeners();
  }
}
