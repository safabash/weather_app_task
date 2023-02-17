import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProviderSplash>(context, listen: false);

    controller.gotoHome(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 59, 3, 99),
            Color.fromARGB(133, 128, 19, 201),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        alignment: Alignment.center,
        child: Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 237, 232, 238),
            highlightColor: const Color.fromARGB(135, 111, 79, 155),
            child: controller.text),
      ),
    );
  }
}
