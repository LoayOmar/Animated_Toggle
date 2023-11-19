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
  int secondVExIndex = 0;
  int secondHExIndex = 0;
  int lastHExIndex = 0;
  int lastVExIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Animated Toggle',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          // you should add the taps, width, height, and duration
          child: SingleChildScrollView(
            child: Column(
              children: [
                animatedHorizontalToggle(context),
                const SizedBox(
                  height: 30,
                ),
                animatedVerticalToggle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column animatedVerticalToggle() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedVerticalToggle(
              taps: const ['First', 'Second', 'Third', 'Last'],
              width: 80,
              height: 200,
              duration: const Duration(milliseconds: 300),
              activeButtonHeight: 34,
              initialIndex: 0,
              background: Colors.black.withOpacity(0.1),
              activeColor: Colors.deepPurple,
              // here you can control the active text style
              activeTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              // here you can control the inactive text style
              inActiveTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.deepPurple),
              // the next 2 line if you need to put padding for the inactive buttons
              horizontalPadding: 4,
              verticalPadding: 4,
              // the next 2 line if you need to put padding for the active button
              activeHorizontalPadding: 4,
              activeVerticalPadding: 2,
              radius: 14,
              // you can control the radius for the Animated widget
              activeButtonRadius: 10,
              // you can control the radius for the active button
              onChange: (index) {
                // write Your Personal Code Here
              },
              showActiveButtonColor: true,
              // 'en' mean make the start from left other mean start from right
              local:
                  'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
            ),
            AnimatedVerticalToggle(
              taps: const ['First', 'Second', 'Third', 'Last'],
              width: 80,
              height: 200,
              duration: const Duration(milliseconds: 300),
              activeButtonHeight: 34,
              initialIndex: 0,
              background: Colors.transparent,
              activeBorder: Border.all(color: Colors.black),
              //inActiveBorder: Border.all(color: Colors.black),
              inActiveColor: Colors.white,
              inActiveBoxShadow: [
                BoxShadow(
                  offset: const Offset(0,2.2),
                  blurRadius: 12,
                  color: Colors.black.withOpacity(0.08),
                ),
              ],
              activeColor: Colors.deepPurple.withOpacity(0.5),
              // here you can control the active text style
              activeTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              // here you can control the inactive text style
              inActiveTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.deepPurple),
              // the next 2 line if you need to put padding for the inactive buttons
              horizontalPadding: 4,
              verticalPadding: 4,
              // the next 2 line if you need to put padding for the active button
              activeHorizontalPadding: 4,
              activeVerticalPadding: 2,
              radius: 14,
              // you can control the radius for the Animated widget
              activeButtonRadius: 10,
              inActiveButtonRadius: 10,
              // you can control the radius for the active button
              onChange: (index) {
                // write Your Personal Code Here
              },
              showActiveButtonColor: true,
              // 'en' mean make the start from left other mean start from right
              local:
                  'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
            ),
            AnimatedVerticalToggle(
              taps: const ['First', 'Second', 'Last'],
              // write you taps names
              width: 105,
              height: 200,
              duration: const Duration(milliseconds: 300),
              initialIndex: 0,
              showPrefixIcon: true,
              spaceBetweenIconAndText: 8,
              prefixIcons: [
                Icon(
                  Icons.ac_unit_rounded,
                  color: secondVExIndex == 0 ? Colors.white : Colors.deepPurple,
                ),
                Icon(
                  Icons.accessibility_new_rounded,
                  color: secondVExIndex == 1 ? Colors.white : Colors.deepPurple,
                ),
                Icon(
                  Icons.account_balance_wallet,
                  color: secondVExIndex == 2 ? Colors.white : Colors.deepPurple,
                ),
              ],
              background: Colors.black.withOpacity(0.1),
              activeColor: Colors.deepPurple,
              // here you can control the active text style
              activeTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              // here you can control the inactive text style
              inActiveTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.deepPurple),
              // the next 2 line if you need to put padding for the inactive buttons
              horizontalPadding: 4,
              verticalPadding: 4,
              // the next 2 line if you need to put padding for the active button
              activeHorizontalPadding: 4,
              activeVerticalPadding: 2,
              radius: 14,
              // you can control the radius for the Animated widget
              activeButtonRadius: 14,
              // you can control the radius for the active button
              onChange: (index) {
                //You should know the index here listening to the index changing when the toggle moving
                //if you move from 0 to 3 the index will be 1 then will be 2
                //this will make the moving and change the color more smooth
                //if you make the duration milliseconds: 300 so you will get the real current index after 300 milliseconds
                setState(() {
                  secondVExIndex = index;
                });
              },
              showActiveButtonColor: true,
              // 'en' mean make the start from left other mean start from right
              local:
                  'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedVerticalToggle(
              taps: const ['First', 'Second', 'Last'],
              // write you taps names
              width: 90,
              height: 200,
              duration: const Duration(milliseconds: 300),
              initialIndex: 0,
              background: Colors.transparent,
              // here you can control the active text style
              activeTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple),
              // here you can control the inactive text style
              inActiveTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              // the next 2 line if you need to put padding for the inactive buttons
              horizontalPadding: 8,
              verticalPadding: 0,
              // the next 2 line if you need to put padding for the active button
              activeHorizontalPadding: 0,
              activeVerticalPadding: 0,
              radius: 14,
              // you can control the radius for the Animated widget
              activeButtonRadius: 14,
              // you can control the radius for the active button
              sideLineWidth: 1,
              // this the thickness for the line down
              activeSideLineWidth: 2,
              // this the thickness for the line down the active only
              onChange: (index) {
                // write Your Personal Code Here
              },
              sideLineColor: Colors.black.withOpacity(0.3),
              activeSideLineColor: Colors.deepPurple,
              showSideLine: true,
              showActiveButtonColor: false,
              // 'en' mean make the start from left other mean start from right
              local:
                  'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
            ),
            AnimatedVerticalToggle(
              taps: const ['First', 'Second', 'Third', 'Last'],
              // write you taps names
              width: 120,
              height: 200,
              duration: const Duration(milliseconds: 300),
              initialIndex: 0,
              showPrefixIcon: true,
              spaceBetweenIconAndText: 8,
              prefixIcons: [
                Icon(
                  Icons.ac_unit_rounded,
                  color: lastVExIndex == 0 ? Colors.deepPurple : Colors.black,
                ),
                Icon(
                  Icons.accessibility_new_rounded,
                  color: lastVExIndex == 1 ? Colors.deepPurple : Colors.black,
                ),
                Icon(
                  Icons.account_balance_wallet,
                  color: lastVExIndex == 2 ? Colors.deepPurple : Colors.black,
                ),
                Icon(
                  Icons.account_balance,
                  color: lastVExIndex == 3 ? Colors.deepPurple : Colors.black,
                ),
              ],
              background: Colors.transparent,
              // here you can control the active text style
              activeTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple),
              // here you can control the inactive text style
              inActiveTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              // the next 2 line if you need to put padding for the inactive buttons
              horizontalPadding: 8,
              verticalPadding: 0,
              // the next 2 line if you need to put padding for the active button
              activeHorizontalPadding: 0,
              activeVerticalPadding: 0,
              radius: 14,
              // you can control the radius for the Animated widget
              activeButtonRadius: 14,
              // you can control the radius for the active button
              sideLineWidth: 1,
              // this the thickness for the line down
              activeSideLineWidth: 2,
              // this the thickness for the line down the active only
              onChange: (index) {
                //You should know the index here listening to the index changing when the toggle moving
                //if you move from 0 to 3 the index will be 1 then will be 2
                //this will make the moving and change the color more smooth
                //if you make the duration milliseconds: 300 so you will get the real current index after 300 milliseconds
                setState(() {
                  lastVExIndex = index;
                });
              },
              sideLineColor: Colors.black.withOpacity(0.3),
              activeSideLineColor: Colors.deepPurple,
              showSideLine: true,
              showActiveButtonColor: false,
              // 'en' mean make the start from left other mean start from right
              local:
                  'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
            ),
          ],
        )
      ],
    );
  }

  Widget animatedHorizontalToggle(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        AnimatedHorizontalToggle(
          taps: const ['First', 'Second', 'Last'],
          // write you taps names
          width: MediaQuery.of(context).size.width - 40,
          height: 48,
          duration: const Duration(milliseconds: 500),
          initialIndex: 0,
          background: Colors.transparent,
          activeBorder: Border.all(color: Colors.black),
          //inActiveBorder: Border.all(color: Colors.black),
          inActiveColor: Colors.white,
          inActiveBoxShadow: [
            BoxShadow(
              offset: const Offset(0,2.2),
              blurRadius: 12,
              color: Colors.black.withOpacity(0.08),
            ),
          ],
          activeColor: Colors.deepPurple.withOpacity(0.5),
          // here you can control the active text style
          activeTextStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          // here you can control the inactive text style
          inActiveTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple),
          // the next 2 line if you need to put padding for the inactive buttons
          horizontalPadding: 4,
          verticalPadding: 4,
          // the next 2 line if you need to put padding for the active button
          activeHorizontalPadding: 2,
          activeVerticalPadding: 4,
          radius: 14,
          // you can control the radius for the Animated widget
          activeButtonRadius: 14,
          inActiveButtonRadius: 14,
          // you can control the radius for the active button
          onChange: (index) {
            // write Your Personal Code Here
          },
          showActiveButtonColor: true,
          // 'en' mean make the start from left other mean start from right
          local:
          'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
        ),
        const SizedBox(
          height: 30,
        ),
        AnimatedHorizontalToggle(
          taps: const ['First', 'Second', 'Last'],
          // write you taps names
          width: MediaQuery.of(context).size.width - 40,
          height: 48,
          duration: const Duration(milliseconds: 300),
          initialIndex: 0,
          background: Colors.black.withOpacity(0.1),
          activeColor: Colors.deepPurple,
          // here you can control the active text style
          activeTextStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          // here you can control the inactive text style
          inActiveTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple),
          // the next 2 line if you need to put padding for the inactive buttons
          horizontalPadding: 4,
          verticalPadding: 4,
          // the next 2 line if you need to put padding for the active button
          activeHorizontalPadding: 2,
          activeVerticalPadding: 4,
          radius: 14,
          // you can control the radius for the Animated widget
          activeButtonRadius: 14,
          // you can control the radius for the active button
          onChange: (index) {
            // write Your Personal Code Here
          },
          showActiveButtonColor: true,
          // 'en' mean make the start from left other mean start from right
          local:
              'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
        ),
        const SizedBox(
          height: 30,
        ),
        AnimatedHorizontalToggle(
          taps: const ['First', 'Second', 'Last'],
          // write you taps names
          width: MediaQuery.of(context).size.width - 40,
          height: 48,
          duration: const Duration(milliseconds: 300),
          initialIndex: 0,
          showPrefixIcon: true,
          spaceBetweenIconAndText: 8,
          prefixIcons: [
            Icon(
              Icons.ac_unit_rounded,
              color: secondHExIndex == 0 ? Colors.white : Colors.deepPurple,
            ),
            Icon(
              Icons.accessibility_new_rounded,
              color: secondHExIndex == 1 ? Colors.white : Colors.deepPurple,
            ),
            Icon(
              Icons.account_balance_wallet,
              color: secondHExIndex == 2 ? Colors.white : Colors.deepPurple,
            ),
          ],
          background: Colors.black.withOpacity(0.1),
          activeColor: Colors.deepPurple,
          // here you can control the active text style
          activeTextStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          // here you can control the inactive text style
          inActiveTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple),
          // the next 2 line if you need to put padding for the inactive buttons
          horizontalPadding: 4,
          verticalPadding: 4,
          // the next 2 line if you need to put padding for the active button
          activeHorizontalPadding: 2,
          activeVerticalPadding: 4,
          radius: 14,
          // you can control the radius for the Animated widget
          activeButtonRadius: 14,
          // you can control the radius for the active button
          onChange: (index) {
            //You should know the index here listening to the index changing when the toggle moving
            //if you move from 0 to 3 the index will be 1 then will be 2
            //this will make the moving and change the color more smooth
            //if you make the duration milliseconds: 300 so you will get the real current index after 300 milliseconds
            setState(() {
              secondHExIndex = index;
            });
          },
          showActiveButtonColor: true,
          // 'en' mean make the start from left other mean start from right
          local:
              'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
        ),
        const SizedBox(
          height: 30,
        ),
        AnimatedHorizontalToggle(
          taps: const ['First', 'Second', 'Last'],
          // write you taps names
          width: MediaQuery.of(context).size.width - 40,
          height: 48,
          duration: const Duration(milliseconds: 300),
          initialIndex: 0,
          background: Colors.transparent,
          // here you can control the active text style
          activeTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple),
          // here you can control the inactive text style
          inActiveTextStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          // the next 2 line if you need to put padding for the inactive buttons
          horizontalPadding: 0,
          verticalPadding: 0,
          // the next 2 line if you need to put padding for the active button
          activeHorizontalPadding: 0,
          activeVerticalPadding: 0,
          radius: 14,
          // you can control the radius for the Animated widget
          activeButtonRadius: 14,
          // you can control the radius for the active button
          underLineHeight: 1,
          // this the thickness for the line down
          activeUnderLineHeight: 2,
          // this the thickness for the line down the active only
          onChange: (index) {
            // write Your Personal Code Here
          },
          underLineColor: Colors.black.withOpacity(0.3),
          activeUnderLineColor: Colors.deepPurple,
          showUnderLine: true,
          showActiveButtonColor: false,
          // 'en' mean make the start from left other mean start from right
          local:
              'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
        ),
        const SizedBox(
          height: 30,
        ),
        AnimatedHorizontalToggle(
          taps: const ['First', 'Second', 'Last'],
          // write you taps names
          width: MediaQuery.of(context).size.width - 40,
          height: 48,
          duration: const Duration(milliseconds: 300),
          initialIndex: 0,
          showPrefixIcon: true,
          spaceBetweenIconAndText: 8,
          prefixIcons: [
            Icon(
              Icons.ac_unit_rounded,
              color: lastHExIndex == 0 ? Colors.deepPurple : Colors.black,
            ),
            Icon(
              Icons.accessibility_new_rounded,
              color: lastHExIndex == 1 ? Colors.deepPurple : Colors.black,
            ),
            Icon(
              Icons.account_balance_wallet,
              color: lastHExIndex == 2 ? Colors.deepPurple : Colors.black,
            ),
          ],
          background: Colors.transparent,
          // here you can control the active text style
          activeTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple),
          // here you can control the inactive text style
          inActiveTextStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          // the next 2 line if you need to put padding for the inactive buttons
          horizontalPadding: 0,
          verticalPadding: 0,
          // the next 2 line if you need to put padding for the active button
          activeHorizontalPadding: 0,
          activeVerticalPadding: 0,
          radius: 14,
          // you can control the radius for the Animated widget
          activeButtonRadius: 14,
          // you can control the radius for the active button
          underLineHeight: 1,
          // this the thickness for the line down
          activeUnderLineHeight: 2,
          // this the thickness for the line down the active only
          onChange: (index) {
            //You should know the index here listening to the index changing when the toggle moving
            //if you move from 0 to 3 the index will be 1 then will be 2
            //this will make the moving and change the color more smooth
            //if you make the duration milliseconds: 300 so you will get the real current index after 300 milliseconds
            setState(() {
              lastHExIndex = index;
            });
          },
          underLineColor: Colors.black.withOpacity(0.3),
          activeUnderLineColor: Colors.deepPurple,
          showUnderLine: true,
          showActiveButtonColor: false,
          // 'en' mean make the start from left other mean start from right
          local:
              'en', // her you can add the local to control the alignment like if you use en its the normal to start from left to right and if you use ar the will start from right to left
        ),
      ],
    );
  }
}
