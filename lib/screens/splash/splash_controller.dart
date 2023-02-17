import 'package:flutter/material.dart';

import '../dashboard/dashboard.dart';

class ProviderSplash with ChangeNotifier {
  var text = Text(
    "Lilac Flutter Assignment",
    style: TextStyle(fontSize: 50.0, color: Colors.white, shadows: <Shadow>[
      Shadow(
          blurRadius: 18.0,
          color: Colors.white,
          offset: Offset.fromDirection(120, 12))
    ]),
  );
  Future<void> gotoHome(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const DashBoard()));
  }
}
