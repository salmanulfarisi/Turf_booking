import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/utils/navigations.dart';
import 'package:turf_booking/view/screen/auth/register.dart';
import 'package:turf_booking/view/screen/screen.dart';
import 'package:turf_booking/view_model/view_model.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Consumer<LoginViewModel>(builder: (context, value, child) {
      return Column(
        children: [
          Consumer<LoginViewModel>(
            builder: (context, value, child) {
              return ElevatedButton(
                onPressed: (() async {
                  await value.loginUser(context);
                }),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.green,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Consumer<LoginViewModel>(
                      builder: (context, value, _) {
                        return controller.isLoading == true
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigations.push(const MobileNumberAuth());
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              height: size.height / 16,
              width: size.width / 1.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
              ),
              child: FittedBox(
                child: Row(
                  children: const [
                    Icon(Icons.mobile_friendly),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Continue with Mobile",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigations.push(const SignupPage());
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
