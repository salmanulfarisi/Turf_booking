import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/controllers/controllers.dart';
import 'package:turf_booking/view/screen/home/widgets/search_grid.dart';
import 'package:turf_booking/view/screen/spot/widget/all_turf_display.dart';
import 'package:turf_booking/view_model/view_model.dart';

class SpotPage extends StatelessWidget {
  const SpotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());

    final homepageController = Provider.of<HomeViewModel>(context);
    final SoptViewModel controller =
        Provider.of<SoptViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      controller.oninit();
    }));
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(CupertinoIcons.location),
                        Text(
                          locationController.currentAddress.value,
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
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        homepageController.isSearchClick = true;
                      } else {
                        homepageController.isSearchClick = false;
                      }
                      controller.search(value);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      suffixIcon: Icon(CupertinoIcons.search),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Consumer<HomeViewModel>(builder: (context, value, _) {
                  return AnimatedCrossFade(
                    firstChild: const AllTurfDisplay(),
                    secondChild: const SearchGrid(),
                    crossFadeState: homepageController.isSearchClick
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                    // firstCurve: Curves.bounceOut,
                    // secondCurve: Curves.,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
