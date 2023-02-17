import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../dashboard_controller.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    super.key,
    required this.controller,
  });

  final DashBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
        height: 200,
        width: 200,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          elevation: 2,
          color: const Color.fromARGB(255, 235, 193, 237),
          child: Consumer<DashBoardController>(
            builder: (context, value, child) {
              return value.isLoading == true
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          controller.model!.location.name,
                          style: GoogleFonts.anton(
                            textStyle: const TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                        Text(
                          controller.model!.location.country,
                          style: GoogleFonts.anton(
                            textStyle: const TextStyle(
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Image.network(controller.model!.current.condition.icon),
                        Text(controller.model!.current.condition.text,
                            style: GoogleFonts.anton(
                                textStyle: const TextStyle(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold)))
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
