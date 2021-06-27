import 'package:flutter/material.dart';
import 'route_names.dart';

class AppRoutePath extends ChangeNotifier {
  String routeName = RouteNames.notFound;
  bool isUnknown = true;
  String? _parameters;

  // ignore: sort_constructors_first
  AppRoutePath.simpleScreen(this.routeName) {
    _parameters = null;
    isUnknown = false;

    notifyListeners();
  }

  // ignore: sort_constructors_first
  AppRoutePath.parameterScreen(this.routeName, this._parameters) {
    isUnknown = false;

    notifyListeners();
  }

  // ignore: sort_constructors_first
  AppRoutePath.unknownScreen() {
    routeName = RouteNames.notFound;
    _parameters = null;
    isUnknown = false;

    notifyListeners();
  }

  ///Returns the complete path with the query
  String get pathWithQuery => routeName + ((_parameters !=null) ? '/$_parameters' : '');
}
