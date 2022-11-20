import 'package:flutter/material.dart';
import 'package:turf_booking/model/nearby_model/nearby_model.dart';

class Details extends StatelessWidget {
  final Datum details;
  const Details({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Details'),
      ),
    );
  }
}
