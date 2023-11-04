import 'package:animated_toggle/animated_toggle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyAnimatedToggle(),
    );
  }
}

class MyAnimatedToggle extends StatefulWidget {
  const MyAnimatedToggle({super.key});

  @override
  State<MyAnimatedToggle> createState() => _MyAnimatedToggleState();
}

class _MyAnimatedToggleState extends State<MyAnimatedToggle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Animated Toggle',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          // you should add the taps, width, height, and duration
          child: AnimatedToggle(
            taps: const ['First', 'Second', 'Last'], // write you taps names
            width: MediaQuery.of(context).size.width - 40,
            height: 48,
            duration: const Duration(milliseconds: 500),
            background: Colors.grey.withOpacity(0.3),
            activeColor: Colors.indigo,
            // here you can control the active text style
            activeTextStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            // here you can control the inactive text style
            inActiveTextStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.indigo),
            // the next 2 line if you need to put padding for the inactive buttons
            horizontalPadding: 4,
            verticalPadding: 4,
            // the next 2 line if you need to put padding for the active button
            activeHorizontalPadding: 0,
            activeVerticalPadding: 0,
            radius: 14, // you can control the radius for the Animated widget
            activeButtonRadius:
                14, // you can control the radius for the active button
            underLineHeight: 1, // this the thickness for the line down
            activeUnderLineHeight:
                2, // this the thickness for the line down the active only
            onChange: (index) {
              // write Your Personal Code Here
            },
            underLineColor: Colors.red,
            activeUnderLineColor: Colors.black,
            showUnderLine: true,
            showActiveButtonColor: true,
            // 'en' mean make the start from left other mean start from right
            local:
                'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
          ),
        ),
      ),
    );
  }
}
