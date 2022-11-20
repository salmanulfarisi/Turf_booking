import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/model/nearby_model/nearby_model.dart';
import 'package:turf_booking/view_model/view_model.dart';

class AllTurfWidget extends StatelessWidget {
  final Datum all;
  const AllTurfWidget({Key? key, required this.all}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SoptViewModel>(
      builder: (context, value, _) {
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/turf.jpg'),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }
}
