import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/controllers/location_controller.dart';
import 'package:turf_booking/view/screen/home/widgets/home_widgets.dart';
import 'package:turf_booking/view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());
    final homepageController = Provider.of<HomeViewModel>(context);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    const Icon(CupertinoIcons.location),
                    Text(
                      'Location: ${locationController.currentAddress.value}',
                      // locationController.currentAddress.value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Icon(CupertinoIcons.bell)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(left: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  suffixIcon: Icon(CupertinoIcons.search),
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer(
              builder: (context, value, child) {
                return AnimatedCrossFade(
                  firstChild: const HomeDisplay(),
                  secondChild: const SearchGrid(),
                  crossFadeState: homepageController.isSearchClick
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 500),
                  firstCurve: Curves.fastOutSlowIn,
                  secondCurve: Curves.fastLinearToSlowEaseIn,
                );
              },
            )
          ],
        )),
      ),
    ));
  }
}
