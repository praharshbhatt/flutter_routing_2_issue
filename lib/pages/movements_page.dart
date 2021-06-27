import 'package:flutter/material.dart';
import 'package:tribes/routing/route_names.dart';
import 'package:tribes/routing/router.dart';
import 'package:tribes/services/service_locator.dart';

import '../utils/color.dart';

class MovementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: themeBackgroundGradient,
        ),
        child: _returnBody(context),
      ),
    );
  }

  Widget _returnBody(BuildContext context) => Scaffold(
        body: Center(
            child: GestureDetector(
          onTap: () {
            locator<AppRouterDelegate>()
                .goToSimplePage(RouteNames.discoverTabRoute);
            //Navigator.pushNamed(context, 'home');
          },
          child: const Text(
            'Movements Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        )),
      );
}
