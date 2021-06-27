import 'package:flutter/material.dart';
import '../routing/route_names.dart';

MaterialPage UnknownPage() {
  return MaterialPage(
    key: const ValueKey(RouteNames.notFound),
    child: Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('404!')),
    ),
  );
}
