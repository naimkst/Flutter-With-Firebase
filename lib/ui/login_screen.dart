import 'package:firebasewithflutter/const/AppColors.dart';
import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
