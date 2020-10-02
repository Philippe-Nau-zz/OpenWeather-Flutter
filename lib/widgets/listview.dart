import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:weather/controller/controller.dart';
import 'package:weather/widgets/card_listview.dart';

class ListviewInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: GetBuilder<MyController>(
        init: MyController(),
        builder: (_controller) => ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CardListview(
              isImage: true,
              titleCard: 'Clima',
              info:
                  'http://openweathermap.org/img/wn/${_controller.icon}@2x.png',
              tooltip: '${_controller.weatherMain}',
            ),
            CardListview(
              isImage: false,
              titleCard: 'Sen. Térmica',
              info: '${_controller.feelsLike.toStringAsFixed(0)}º',
            ),
            CardListview(
              isImage: false,
              titleCard: 'Vento',
              info: '${_controller.windSpeed.toStringAsFixed(0)} Km/h',
            ),
            CardListview(
              isImage: false,
              titleCard: 'Humidade',
              info: '${_controller.humidity.toStringAsFixed(0)}%',
            ),
            CardListview(
              isImage: false,
              titleCard: 'Pressão',
              info: '${_controller.pressure.toStringAsFixed(0)}hPa',
            ),
          ],
        ),
      ),
    );
  }
}
