import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/screens/dashboard/dashboard_controller.dart';
import 'package:weather_app/screens/dashboard/widgets/weather_card_widget.dart';

import 'widgets/info_card_widget.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DashBoardController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        controller.getLocation();
      },
    );
    return Scaffold(
        body: Stack(
      children: [
        Image.network(
          'https://th.bing.com/th/id/OIP.RpGnbM0a3_Hyt2wuYqJSzgHaFi?pid=ImgDet&rs=1',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  WeatherCardWidget(controller: controller),
                  Consumer<DashBoardController>(
                    builder: (context, value, child) {
                      return Text(
                          '${controller.model!.current.tempC.toString()} ℃',
                          style: GoogleFonts.anton(
                              textStyle: const TextStyle(
                                  fontSize: 40,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold)));
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Additional Info',
              style: GoogleFonts.anton(
                  textStyle: const TextStyle(
                      letterSpacing: 1, fontWeight: FontWeight.bold)),
            ),
            Consumer<DashBoardController>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoCardWidget(
                          text: 'Win DR',
                          controller: controller,
                          winDr: controller.model!.current.windDir,
                        ),
                        InfoCardWidget(
                          text: 'Humidity',
                          controller: controller,
                          winDr: controller.model!.current.humidity.toString(),
                        ),
                        InfoCardWidget(
                          text: 'Pressure',
                          controller: controller,
                          winDr:
                              controller.model!.current.pressureMb.toString(),
                        ),
                        InfoCardWidget(
                          text: 'Cloud',
                          controller: controller,
                          winDr: controller.model!.current.cloud.toString(),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        )
      ],
    ));
  }
}
