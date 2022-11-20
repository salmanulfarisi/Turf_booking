import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:turf_booking/model/model.dart';
import 'package:turf_booking/model/nearby_model/nearby_model.dart';
import 'package:turf_booking/services/services.dart';
import 'package:turf_booking/view/screen/screen.dart';

class BookinController extends ChangeNotifier {
  bool morning = false;
  bool afternoon = false;
  bool evening = false;
  bool expiare = false;
  var finalTime = 0;
  DateTime selectedDate = DateTime.now();
  int selectedDay = DateTime.now().day;
  var formatter = 0;
  var totalPrice = 0;
  late Datum id;
  late BuildContext cxt;

  Map<String, List<int>> alReadyBookedList = {};

  List<BookNowTimeSlot> allReadyBook = [];

  List<int> times = [];
  List morningTime = [];
  List afternoonTime = [];
  List eveningTime = [];
  List selectedTime = [];
  List result = [];
  List<int> sendToBackend = [];

  void isMorning() {
    morning = !morning;
    afternoon = false;
    evening = false;
    notifyListeners();
  }

  void isAfternoon() {
    afternoon = !afternoon;
    evening = false;
    morning = false;
    notifyListeners();
  }

  void isEvening() {
    evening = !evening;
    afternoon = false;
    morning = false;
    notifyListeners();
  }

  void close() {
    morning = true;
    afternoon = false;
    evening = false;
  }

  void dayTime() {
    var hr = DateTime.now().hour;
    if (hr < 12) {
      morning = true;
      evening = false;
      afternoon = false;
    } else if (hr <= 16) {
      afternoon = true;
      morning = false;
      evening = false;
    } else {
      evening = true;
      morning = false;
      afternoon = false;
    }
    notifyListeners();
  }

//////////////////////////////////time
  timing(Datum time) {
    times.clear();
    times.addAll([
      time.turfTime!.timeMorningStart!,
      time.turfTime!.timeMorningEnd!,
      time.turfTime!.timeAfternoonStart!,
      time.turfTime!.timeAfternoonEnd!,
      time.turfTime!.timeEveningStart!,
      time.turfTime!.timeEveningEnd!
    ]);
    for (int i = 0; i < times.length; i++) {
      if (times[i] > 12) {
        times[i] = times[i] - 12;
      }
    }
  }

//////////////////////////booking
  bookingDayTime(int start, int end, List alltimes, String space) {
    alltimes.clear();
    for (int i = start; i < end; i++) {
      alltimes.add("$space${i.toString()}:00 - ${(i + 1).toString()}:00$space");
    }
  }

/////////////////////////////////////////////////////////////// Selecting Times
  selectedTimes({
    required String time,
    required String key,
    context,
    required int cash,
  }) {
    // sendToBackend.clear();
    int timeList;

    if (key == "Morning") {
      timeList = int.parse(time.trim().split(":").first);
    } else {
      timeList = int.parse(time.trim().split(":").first) + 12;
    }

    if (selectedDay == DateTime.now().day) {
      if (selectedTime.contains(time) || result.contains(timeList)) {
        if (timeList > DateTime.now().hour) {
          if (!result.contains(timeList)) {
            totalPrice -= cash;
          }
          sendToBackend.remove(timeList);
          selectedTime.remove(time);
        }
      } else {
        if (timeList > DateTime.now().hour) {
          totalPrice += cash;
          sendToBackend.add(timeList);
          selectedTime.add(time);
        } else {
          log('time not available 333');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Time Out'),
              backgroundColor: Color.fromARGB(255, 97, 98, 97),
            ),
          );
        }
      }
    } else {
      if (selectedTime.contains(time) || result.contains(timeList)) {
        if (!result.contains(timeList)) {
          totalPrice -= cash;
        }
        sendToBackend.remove(timeList);

        selectedTime.remove(time);
      } else {
        totalPrice += cash;
        selectedTime.add(time);
        sendToBackend.add(timeList);
      }
    }

    log(time.toString());
    log("Selected time $selectedTime");
    log("send to backend $sendToBackend");
    notifyListeners();
  }
//------------------------------------------------------------------------------------------------------------

  bool isAvailableCheckFunction({
    required String item,
    required String heading,
  }) {
    var temp = item.trim();
    var splittedtime = temp.split(':').first;
    var parsedTime = int.parse(splittedtime);
    if (heading != 'Morning') {
      finalTime = parsedTime + 12;
    } else {
      finalTime = parsedTime;
    }
    return (DateTime.now().hour >= finalTime &&
            selectedDay == DateTime.now().day) ||
        result.contains(finalTime);
  }

////////////////////////////////////Selected Date
  selectDate(data) {
    final date = DateTime.parse(data.toString());
    selectedDate = date;
    selectedDay = int.parse(data.toString().split("-").last);
    selectedTime.clear();
    notifyListeners();
  }

////////////////////////////////AllReady booked
  allReadyBooked(idTurf) async {
    GetAllTurfTimeSlot? bookedSlot = await BookingService.instance.book(idTurf);
    alReadyBookedList.clear();
    if (bookedSlot != null) {
      for (var element in bookedSlot.data!) {
        alReadyBookedList[element.bookingDate!] = element.timeSlot!;
      }
      log("RRRRRRRRRRRRRRRRRRRRRRRRRRRR${alReadyBookedList.toString()}");
    }
    notifyListeners();
  }

///////////////////////////////////////////////////Date checking
  checkingDate() {
    result.clear();
    final formatter = DateFormat.yMd().format(selectedDate);
    log("full selected slots   $alReadyBookedList");
    if (alReadyBookedList.containsKey(formatter)) {
      alReadyBookedList[formatter];
      result.addAll(alReadyBookedList[formatter]!);
      log("formated date $formatter");
    }
    log("result ${result.toString()}");
  }

////////////////////////////////////////////////////////Book now/
  continueBooking(Datum data, context) async {
    final bookInDate = DateFormat.yMd().format(selectedDate);
    final turfid = data.id;
    // log(sendToBackend.toString());
    // log(bookInDate);
    // log('send to backend inside continue booking $sendToBackend');
    BookNowTimeSlot turfDetails = BookNowTimeSlot(
      bookingDate: bookInDate.toString(),
      id: turfid,
      timeSlot: sendToBackend,
    );
    bool bookInSlot = await BookingServiceAdd.instance.book(turfDetails);
    if (bookInSlot) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text("Booked"),
      //   backgroundColor: Color.fromARGB(255, 97, 98, 97),
      // ));
      log(",,,,,,,,,,,,,,,,,,,,,,,,,,,$bookInSlot,,,,,,,");
    }
    log(",,,,,,,,,,,,77777777,,,,,,,,,,,,,,,$bookInSlot,,,,,,,");
    Get.offAll(() => const BottomNavigation());
    notifyListeners();
  }

////////////////////////////////////////////////rayzon pay
  // Razorpay razorpay = Razorpay();

  // void oninit() {
  //   razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //   razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //   razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  // }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   continueBooking(id, cxt);
  //   Get.offAll(() => BottomNavigation());
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {}

  // void _handleExternalWallet(ExternalWalletResponse response) {}

  // @override
  // void dispose() {
  //   super.dispose();

  //   razorpay.clear();
  // }

  // razorpayOption(int totalPrice, Datum data, context) {
  //   id = data;
  //   cxt = context;
  //   var options = {
  //     'key': 'rzp_test_JoO24Z2D1yYvCF',
  //     'amount': totalPrice * 100, //in the smallest currency sub-unit.
  //     'name': 'Amal.',
  //     // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
  //     'description': 'Turf',
  //     'timeout': 60, // in seconds
  //     'prefill': {'contact': '8606586632', 'email': 'amalpkdrv@gmail.com'}
  //   };
  //   razorpay.open(options);
  // }
}

// ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Text('Awesome SnackBar!'),
//             duration: const Duration(milliseconds: 1500),
//             width: 280.0, // Width of the SnackBar.
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8.0, // Inner padding for SnackBar content.
//             ),
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//         );
