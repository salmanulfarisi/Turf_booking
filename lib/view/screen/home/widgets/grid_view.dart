import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view/screen/details/details.dart';
import 'package:turf_booking/view_model/view_model.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homePageController =
        Provider.of<HomeViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Consumer<HomeViewModel>(
      builder: (context, value, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FittedBox(
              child: Text(
                'Nearby Grounds',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homePageController.near.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final turfs = homePageController.near[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(Details(
                      details: turfs,
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: size.height / 22,
                          backgroundImage: NetworkImage(turfs.turfLogo!),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Text(
                            turfs.turfName!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              CupertinoIcons.location,
                              color: Colors.red,
                            ),
                            Text(
                              turfs.turfPlace!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              CupertinoIcons.star_fill,
                              color: Colors.yellow,
                            ),
                            Text(
                              turfs.turfInfo!.turfRating.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
