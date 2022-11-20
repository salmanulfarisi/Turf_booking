import 'package:flutter/material.dart';
import 'package:turf_booking/model/nearby_model/nearby_model.dart';

class AmenititesWidget extends StatelessWidget {
  const AmenititesWidget({super.key, required this.details});
  final Datum details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    details.turfAmenities!.turfWater == true
                        ? Icons.check_circle
                        : Icons.cancel_rounded,
                    size: 20,
                    color: details.turfAmenities!.turfWater == true
                        ? Colors.green
                        : Colors.red,
                  ),
                  const Text(
                    "Water",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    details.turfAmenities!.turfDressing == true
                        ? Icons.check_circle
                        : Icons.cancel_rounded,
                    size: 20,
                    color: details.turfAmenities!.turfDressing == true
                        ? Colors.green
                        : Colors.red,
                  ),
                  const Text(
                    "Dressing Room",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    details.turfAmenities!.turfCafeteria == true
                        ? Icons.check_circle
                        : Icons.cancel_rounded,
                    size: 20,
                    color: details.turfAmenities!.turfCafeteria == true
                        ? Colors.green
                        : Colors.red,
                  ),
                  const Text(
                    "Cafeteria",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  details.turfAmenities!.turfParking == true
                      ? Icons.check_circle
                      : Icons.cancel_rounded,
                  size: 20,
                  color: details.turfAmenities!.turfParking == true
                      ? Colors.green
                      : Colors.red,
                ),
                const Text(
                  "Parking",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  details.turfAmenities!.turfWashroom == true
                      ? Icons.check_circle
                      : Icons.cancel_rounded,
                  size: 20,
                  color: details.turfAmenities!.turfWashroom == true
                      ? Colors.green
                      : Colors.red,
                ),
                const Text(
                  "Wash Room",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  details.turfAmenities!.turfGallery == true
                      ? Icons.check_circle
                      : Icons.cancel_rounded,
                  size: 20,
                  color: details.turfAmenities!.turfGallery == true
                      ? Colors.green
                      : Colors.red,
                ),
                const Text(
                  "Gallery",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
