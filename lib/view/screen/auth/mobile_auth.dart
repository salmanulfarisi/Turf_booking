import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view/widgets/widgets.dart';
import 'package:turf_booking/view_model/view_model.dart';

class MobileNumberAuth extends StatelessWidget {
  const MobileNumberAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MobielOTPViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height / 8.3,
                  ),
                  const Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const Text(
                    'Sign In to Continue',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFieldWidget(
                    hint: 'Mobile Number',
                    validator: "validator",
                    controller: controller.numberTextField,
                    keybord: TextInputType.phone,
                    icon: CupertinoIcons.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        controller.loginMobileOTP(context);
                        controller.numberTextField.clear();
                      },
                      child: const Text("Sign In"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
