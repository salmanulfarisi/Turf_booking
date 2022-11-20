import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.exit_to_app,
          ),
        ),
      ),
    );
  }
}
