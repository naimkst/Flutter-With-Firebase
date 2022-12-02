import 'package:firebasewithflutter/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Onbording Screen",
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
