import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view_model/view_model.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({
    super.key,
    // required this.detail,
    required this.dayTimes,
    required this.icon,
    required this.price,
    required this.clr,
  });
  // final Datum detail;
  final String dayTimes;
  final Icon icon;
  final String price;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    DetailsController controller = context.read<DetailsController>();
    return Consumer<DetailsController>(
      builder: (context, value, _) {
        return AnimatedContainer(
          width: controller.priceOnTap ? wid / 3.2 : 0,
          height: controller.priceOnTap ? 200 : 0,
          color: controller.priceOnTap ? Colors.white : Colors.white12,
          alignment: controller.priceOnTap
              ? Alignment.center
              : AlignmentDirectional.centerEnd,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: FittedBox(
            child: Container(
              height: 150,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: clr,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(height: 20),
                  Text(
                    // "Morning Price",
                    dayTimes,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    // detail.turfPrice!.morningPrice.toString(),
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
