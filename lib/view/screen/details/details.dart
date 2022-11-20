import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/model/nearby_model/nearby_model.dart';
import 'package:turf_booking/view/screen/screen.dart';
import 'package:turf_booking/view_model/view_model.dart';

import 'widgets/details_widgets.dart';

class Details extends StatelessWidget {
  final Datum details;
  const Details({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final List<String> imagUrL = [
      details.turfImages!.turfImages1!,
      details.turfImages!.turfImages2!,
      details.turfImages!.turfImages3!
    ];
    final bookincontroller = Provider.of<BookinController>(context);

    final controller = Provider.of<DetailsController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (() {
            controller.priceOnTap = false;
            Get.back();
          }),
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  CupertinoIcons.heart,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                        "asset/image/download__2_-removebg-preview.png"),
                    const Text(
                      "7's",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                        "asset/image/download__2_-removebg-preview.png"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider.builder(
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final imagurl = imagUrL[index];
                  return buildImage(imagurl, index);
                },
                itemCount: imagUrL.length,
                options: CarouselOptions(
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlay: true,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  details.turfName.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Text(
              //   "${details.turfPlace.toString()},${details.turfDistrict.toString()}",
              //   style: const TextStyle(fontSize: 20, color: Colors.black),
              // ),
              //  Consumer<DetailsController>(builder: (context, value, _) {
              //       return ElevatedButton(
              //         onPressed: () {
              //           value.priceOntap();
              //         },
              //         child: const Text("Price"),
              //       );
              //     }),
              // height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${details.turfPlace.toString()},${details.turfDistrict.toString()}",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Consumer<DetailsController>(builder: (context, value, _) {
                    return ElevatedButton(
                      onPressed: () {
                        value.priceOntap();
                      },
                      child: const Text("Price"),
                    );
                  }),
                  // ,
                  // Consumer<DetailsController>(builder: (context, value, _) {
                  //   return ElevatedButton(
                  //     onPressed: () {
                  //       value.priceOntap();
                  //     },
                  //     child: const Text("Price"),
                  //   );
                  // }),
                  // ElevatedButton(
                  //   onPressed: (() {}),
                  //   child: const Text("Location"),
                  // )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  PriceDetailsWidget(
                    // detail: details,
                    dayTimes: "Morning Price",
                    icon: const Icon(
                      Icons.wb_sunny,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    price: details.turfPrice!.morningPrice.toString(),
                    clr: const Color.fromARGB(255, 242, 238, 192),
                  ),
                  PriceDetailsWidget(
                    // detail: details,
                    dayTimes: "Afternoon Price",
                    icon: const Icon(
                      Icons.wb_sunny,
                      color: Colors.orange,
                      size: 25,
                    ),
                    price: details.turfPrice!.afternoonPrice.toString(),
                    clr: const Color.fromARGB(255, 240, 220, 190),
                  ),
                  PriceDetailsWidget(
                    // detail: details,
                    dayTimes: "Evening Price",
                    icon: const Icon(
                      Icons.nights_stay,
                      color: Colors.blueGrey,
                      size: 25,
                    ),
                    price: details.turfPrice!.eveningPrice.toString(),
                    clr: const Color.fromARGB(255, 198, 226, 239),
                  ),
                ],
              ),
              const Text(
                "Amenities",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                  children: List.generate(
                    1,
                    ((index) => AmenititesWidget(
                          details: details,
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 10, left: 10),
        child: FloatingActionButton.extended(
          onPressed: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => BookingPage(bookingDetails: details)),
              ),
            );
            bookincontroller.dayTime();
            bookincontroller.timing(details);
            bookincontroller.bookingDayTime(bookincontroller.times[0],
                bookincontroller.times[1], bookincontroller.morningTime, '');
            bookincontroller.bookingDayTime(bookincontroller.times[2],
                bookincontroller.times[3], bookincontroller.afternoonTime, ' ');
            bookincontroller.bookingDayTime(bookincontroller.times[4],
                bookincontroller.times[5], bookincontroller.eveningTime, '  ');
            bookincontroller.selectedTime.clear();
            bookincontroller.allReadyBooked(details.id);
            bookincontroller.totalPrice = 0;
            bookincontroller.sendToBackend.clear();
          }),
          label: const Text(
            "BOOK",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          extendedPadding:
              const EdgeInsetsDirectional.only(start: 150, end: 150),
        ),
      ),
    );
  }
}

Widget buildImage(String imageUrl, int index) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 200,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(60),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
