import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_booking/view/screen/auth/widgets/bottom_container.dart';
import 'package:turf_booking/view/widgets/widgets.dart';
import 'package:turf_booking/view_model/view_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Provider.of<LoginViewModel>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text('Hello',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    )),
                const Text(
                  'Sign In On Your Account',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                TextFieldWidget(
                  hint: 'E-mail',
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text('Forget Password'),
                  ),
                ),
                const BottomContainer(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
