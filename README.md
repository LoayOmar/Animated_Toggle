# Animated Toggle

Animated Toggle Give you easy way to make your custom Animated toggle.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  your_package_name: ^1.0.0
  ```

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

```dart
import 'package:your_package_name/your_package_name.dart';

void main() {
  
}

// Start use th package in your State Widget
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

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
