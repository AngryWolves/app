import 'package:flutter/material.dart';
import 'package:smart_park/widgets/parking/parking_my_car.dart';

class ParkingHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Column(
        children: <Widget>[
          MyCar(),
        ],
      ),
    );
  }
}
