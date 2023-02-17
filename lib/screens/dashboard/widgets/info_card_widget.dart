import 'package:flutter/material.dart';

import '../dashboard_controller.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    super.key,
    required this.controller,
    required this.winDr,
    required this.text,
  });

  final String winDr;
  final DashBoardController controller;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 193, 237),
          borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Text(text),
        Image.network(controller.model!.current.condition.icon),
        Text(winDr)
      ]),
    );
  }
}
