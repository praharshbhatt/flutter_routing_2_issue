import 'package:flutter/material.dart';

import '../utils/color.dart';

class TribesPage extends StatelessWidget {
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
          onTap: () => {Navigator.pop(context)},
          child: const Text(
            'Tribes Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        )),
      );
}
