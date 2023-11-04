# Animated Toggle

<a href="https://pub.dev/packages/animated_toggle"><img src="https://img.shields.io/pub/v/animated_toggle.svg" alt="Pub"></a>
<a href="https://pub.dev/packages/animated_toggle/score"><img src="https://img.shields.io/pub/likes/animated_toggle?logo=flutter" alt="Pub likes"></a>
<a href="https://pub.dev/packages/animated_toggle/score"><img src="https://img.shields.io/pub/popularity/animated_toggle?logo=flutter" alt="Pub popularity"></a>
<a href="https://pub.dev/packages/animated_toggle/score"><img src="https://img.shields.io/pub/points/animated_toggle?logo=flutter" alt="Pub points"></a>

Animated Toggle Give you easy way to make your custom Animated toggle.


![Vertical Examples](https://raw.githubusercontent.com/LoayOmar/Animated_Toggle/master/assets/gif/V_V.gif) ![Horizontal Examples](https://raw.githubusercontent.com/LoayOmar/Animated_Toggle/master/assets/gif/H_V.gif)

![Full Ex](https://raw.githubusercontent.com/LoayOmar/Animated_Toggle/master/assets/images/F_Ex.jpg) ![Default Ex](https://raw.githubusercontent.com/LoayOmar/Animated_Toggle/master/assets/images/animated_toggle.png)


## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  animated_toggle: 
  ```

## Features

Easy to use the Animated Toggle Package you can handle all colors and width and the height and you can make it vertical or horizontal.
You can control the start from left or right if you need this for arabic or english or etc.
you can control the Text Style and the padding for the Animated Toggle.

## Getting started

```dart
import 'package:animated_toggle/animated_toggle.dart';

void main() {
  
}

// Start use th package in your State Widget
  ```

## What you can handle

Horizontal Animated Toggle

<p>
 <img src="https://raw.githubusercontent.com/LoayOmar/Animated_Toggle/master/assets/images/H_Ex.jpeg"/>
</p>

```dart
final Duration duration;
final List<String> taps;
final double width;
final double height;
final int initialIndex;
final Color background;
final Color activeColor;
final Color underLineColor;
final Color activeUnderLineColor;
final TextStyle activeTextStyle;
final TextStyle inActiveTextStyle;
final double horizontalPadding;
final double verticalPadding;
final double activeHorizontalPadding;
final double activeVerticalPadding;
final double radius;
final double underLineHeight;
final double activeUnderLineHeight;
final double activeButtonRadius;
final Function(int index)? onChange;
final bool showUnderLine;
final bool showActiveButtonColor;
final String local;
final List<Widget>? prefixIcons;
final bool showPrefixIcon;
final double spaceBetweenIconAndText;
```

Vertical Animated Toggle

<p>
 <img src="https://raw.githubusercontent.com/LoayOmar/Animated_Toggle/master/assets/images/V_Ex.jpeg"/>
</p>

```dart
final Duration duration;
final List<String> taps;
final double width;
final double height;
final int initialIndex;
final Color background;
final Color activeColor;
final Color sideLineColor;
final Color activeSideLineColor;
final TextStyle activeTextStyle;
final TextStyle inActiveTextStyle;
final double horizontalPadding;
final double verticalPadding;
final double activeHorizontalPadding;
final double activeVerticalPadding;
final double radius;
final double activeButtonHeight;
final double sideLineWidth;
final double activeSideLineWidth;
final double activeButtonRadius;
final Function(int index)? onChange;
final bool showSideLine;
final bool showActiveButtonColor;
final String local;
final List<Widget>? prefixIcons;
final bool showPrefixIcon;
final double spaceBetweenIconAndText;
```

## Usage

**For More Examples Go To Example Tap**


How to use Horizontal Animated Toggle

```dart
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Animated Toggle'),
      ),
      body: Center(
        child: AnimatedHorizontalToggle(
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
      ),
    );
  }
}
```

How to use Vertical Animated Toggle

```dart
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Animated Toggle'),
      ),
      body: Center(
        child: AnimatedVerticalToggle(
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
      ),
    );
  }
}
```


## Additional information

Say to me in GitHub what you need to see in the package in the next update.
Wait for more feature soon.

## Author

[Loay Omar](https://github.com/LoayOmar)