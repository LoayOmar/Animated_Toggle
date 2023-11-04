# Animated Toggle

Animated Toggle Give you easy way to make your custom Animated toggle.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  your_package_name: ^1.0.0
  ```

## Features

```markdown
![Simple Example](https://raw.githubusercontent.com/LoayOmar/Animated_Toggle/master/assets/images/animated_toggle.png)
```

## Getting started

```dart
import 'package:your_package_name/your_package_name.dart';

void main() {
  
}

// Start use th package in your State Widget
  ```

## What you can handle

```dart
final List<String> taps;
final double width;
final double height;
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
final Duration duration;
final String local;
```

## Usage
Simple Example about how to use

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
        child: AnimatedToggle(
          taps: const ['First', 'Second', 'Last'],
          width: MediaQuery.of(context).size.width,
          height: 48,
          duration: const Duration(milliseconds: 500),
          background: Colors.grey,
          activeColor: Colors.indigo,
          activeTextStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          inActiveTextStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.indigo),
          horizontalPadding: 4,
          verticalPadding: 4,
          activeHorizontalPadding: 0,
          activeVerticalPadding: 0,
          radius: 14,
          activeButtonRadius: 14,
          underLineHeight: 1,
          activeUnderLineHeight: 2,
          index: 0,
          onChange: (index) {},
          underLineColor: Colors.grey,
          activeUnderLineColor: Colors.black,
          showUnderLine: false,
          showActiveButtonColor: true,
        ),
      ),
    );
  }
}

```

## Additional information

Say to me in GitHub what you need to see in the package in the next update

## Author

[Loay Omar](https://github.com/LoayOmar)