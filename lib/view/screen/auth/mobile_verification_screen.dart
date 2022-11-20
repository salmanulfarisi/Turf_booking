import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view_model/view_model.dart';

class MobileVerificationScreen extends StatelessWidget {
  const MobileVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MobielOTPViewModel>(context);
    final mobileVerifyController = Provider.of<MobielVerifyViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Verification Code",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text:
                          'Please enter the verification code that we have sent to your Number ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff808d9e),
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: controller.numberTextField.text.trim(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                controller: mobileVerifyController.phoneEditingController,
                length: 6,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                defaultPinTheme: PinTheme(
                  height: 60.0,
                  width: 60.0,
                  textStyle: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 60.0,
                  width: 60.0,
                  textStyle: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  'Dont Skip the page please complete the verification',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff808d9e),
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // const Expanded(child: SizedBox()),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {
                    mobileVerifyController.verifyMobileOtp(context);
                  },
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
