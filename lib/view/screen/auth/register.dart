import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/utils/utils.dart';
import 'package:turf_booking/view/screen/auth/widgets/bottom_container_onregister.dart';
import 'package:turf_booking/view/widgets/widgets.dart';
import 'package:turf_booking/view_model/view_model.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignupController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigations.pop();
                },
                icon: const Icon(CupertinoIcons.back),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Create an account to continue",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    TextFieldWidget(
                      hint: 'Email',
                      validator: '',
                      controller: controller.emailController,
                      keybord: TextInputType.emailAddress,
                      icon: CupertinoIcons.mail,
                    ),
                    TextFieldWidget(
                      hint: 'Password',
                      validator: '',
                      controller: controller.passwordController,
                      keybord: TextInputType.visiblePassword,
                      icon: CupertinoIcons.lock,
                      suffIcon: IconButton(
                        onPressed: () {
                          controller.isobscure();
                        },
                        icon: Icon(
                          controller.obscure
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextFieldWidget(
                      hint: 'Confirm Password',
                      validator: '',
                      controller: controller.conformController,
                      keybord: TextInputType.visiblePassword,
                      icon: CupertinoIcons.lock,
                      suffIcon: IconButton(
                        onPressed: () {
                          controller.isobscure();
                        },
                        icon: Icon(
                          controller.obscure
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BottomContainerOnRegister()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
