import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/controller.dart';
import 'package:weather/widgets/listview.dart';

class TemperatureBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      init: MyController(),
      builder: (_controller) => !_controller.isLoading
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-0.94, -0.7),
                    child: FittedBox(
                      child: Text(
                        '${_controller.cityName.toUpperCase()}, ${_controller.country.toUpperCase()}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.4),
                    child: ListviewInfos(),
                  ),
                  Align(
                    alignment: Alignment(0.0, 0.3),
                    child: Text(
                      '${_controller.temp.toStringAsFixed(0)}º',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 200,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
