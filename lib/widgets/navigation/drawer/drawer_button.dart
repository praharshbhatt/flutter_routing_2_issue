import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _returnDrawerIcon(context);
  }

  Widget _returnDrawerIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}
