import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view_model/view_model.dart';

class CodeVerificationScreen extends StatelessWidget {
  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signupController =
        Provider.of<SignupController>(context, listen: false);
    final emailverifyController =
        Provider.of<EmailVerifyViewModel>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.07,
              ),
              const Text(
                'Code Verification',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text:
                          'Please enter the verification code that we have sent to your email ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff808d9e),
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: signupController.emailController.text.trim(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.green,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: size.width,
                  child: Pinput(
                    controller: emailverifyController.emailController,
                    length: 4,
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
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.green,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              const Center(
                child: Text(
                  'Don\'t Skip the Page, Please complete the Verification',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              InkWell(
                onTap: () {
                  emailverifyController.verifyEmailOtp();
                },
                child: Ink(
                  width: size.width,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
