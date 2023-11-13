import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class AnimatedVerticalToggle extends StatefulWidget {
  const AnimatedVerticalToggle(
      {super.key,
      required this.taps,
      required this.width,
      required this.height,
      required this.duration,
      this.prefixIcons,
      this.showPrefixIcon = false,
      this.spaceBetweenIconAndText = 8,
      this.initialIndex = 0,
      this.background = Colors.grey,
      this.activeColor = Colors.indigo,
      this.activeTextStyle = const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      this.inActiveTextStyle = const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.indigo,
      ),
      this.horizontalPadding = 4,
      this.verticalPadding = 4,
      this.activeHorizontalPadding = 0,
      this.activeVerticalPadding = 0,
      this.radius = 14,
      this.activeButtonRadius = 14,
      this.sideLineWidth = 1,
      this.activeSideLineWidth = 2,
      this.onChange,
      this.sideLineColor = Colors.grey,
      this.activeSideLineColor = Colors.black,
      this.showSideLine = false,
      this.showActiveButtonColor = true,
      this.activeButtonHeight = 40,
      this.local = 'en'});

  /// - From this handel the speed of moving when the toggle is changed
  final Duration duration;


  /// - Add here the names of the buttons
  final List<String> taps;


  /// - Here you can control the width of the toggle
  final double width;


  /// - Here you can control the height of the toggle
  final double height;


  /// - The start index for the toggle
  final int initialIndex;


  /// - Toggle Background
  final Color background;


  /// - Active button color
  final Color activeColor;


  /// - The color of the line in the left side of the buttons
  final Color sideLineColor;


  /// - The active color for the line in the left side of the active button
  final Color activeSideLineColor;


  /// - Text style for the active button
  final TextStyle activeTextStyle;


  /// - Text style for the inActive button
  final TextStyle inActiveTextStyle;


  /// - Horizontal padding for the toggle
  final double horizontalPadding;


  /// - Vertical padding for the toggle
  final double verticalPadding;


  /// - Horizontal padding for the active button
  final double activeHorizontalPadding;


  /// - Vertical padding for the active button
  final double activeVerticalPadding;


  /// - This radius will use for the toggle
  final double radius;


  /// - Control the height for the active button
  final double activeButtonHeight;


  /// - Control the side line width
  final double sideLineWidth;


  /// - Control the active side line width
  final double activeSideLineWidth;


  /// - This radius will use for the active button
  final double activeButtonRadius;


  /// - OnChange function will give you stream of int number
  /// - This number will change when the index change
  /// - If you press on the button number 3 and the index now is zero so the index will start from 0 and will be 1 and stop in 2 like this will give you the moving steps to make the moving smooth and the screen widgets changing with the moving for the toggle
  final Function(int index)? onChange;


  /// - If this true the side line will be active
  final bool showSideLine;


  /// - If this true the active button color will be active
  final bool showActiveButtonColor;


  /// - If this 'en' the toggle will start from left to right and if this 'ar' the toggle will start from right to left
  final String local;


  /// - Here if you need to use specific icon before the text button name
  final List<Widget>? prefixIcons;


  /// - If this true the prefix icon will shown
  final bool showPrefixIcon;


  /// - Handel the space between the prefix icon and the text
  final double spaceBetweenIconAndText;

  @override
  State<AnimatedVerticalToggle> createState() => _AnimatedVerticalToggleState();
}

class _AnimatedVerticalToggleState extends State<AnimatedVerticalToggle>
    with TickerProviderStateMixin {
  Decimal decimalIndex = Decimal.parse('0');
  bool addInitialIndex = false;
  bool moving = false;

  @override
  Widget build(BuildContext context) {
    if (!addInitialIndex) {
      addInitialIndex = true;
      decimalIndex = widget.initialIndex.toDecimal();
    }
    return Container(
      decoration: BoxDecoration(
        color: widget.background,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      height: widget.height,
      width: widget.width,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (widget.showActiveButtonColor)
            AnimatedAlign(
              alignment: Alignment(
                  0,
                  (decimalIndex.toDouble() /
                          (widget.taps.length - 1) *
                          (2 - (widget.verticalPadding / 100))) -
                      1 +
                      ((widget.verticalPadding) / 100)),
              duration: widget.duration,
              child: Container(
                height: widget.activeButtonHeight,
                margin: EdgeInsets.symmetric(
                    vertical: widget.activeVerticalPadding,
                    horizontal: widget.activeHorizontalPadding),
                decoration: BoxDecoration(
                  color: widget.activeColor,
                  borderRadius:
                      BorderRadius.circular(widget.activeButtonRadius),
                ),
              ),
            ),
          if (widget.showSideLine)
            Container(
              width: widget.sideLineWidth,
              color: widget.sideLineColor,
            ),
          if (widget.showSideLine)
            AnimatedAlign(
              alignment: Alignment(
                  -1,
                  (decimalIndex.toDouble() /
                          (widget.taps.length - 1) *
                          (2 - (widget.verticalPadding / 100))) -
                      1 +
                      ((widget.verticalPadding) / 100)),
              duration: widget.duration,
              child: Container(
                height: widget.activeButtonHeight - widget.horizontalPadding,
                width: widget.activeSideLineWidth,
                margin: EdgeInsets.only(
                  top: widget.activeVerticalPadding,
                ),
                decoration: BoxDecoration(
                  color: widget.activeSideLineColor,
                  //borderRadius: BorderRadius.circular(activeButtonRadius),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
            child: buildButtons(),
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < widget.taps.length; i++)
          buildSwitchTab(
            i == decimalIndex.toDouble().round(),
            widget.taps[i],
            widget.prefixIcons != null ? widget.prefixIcons![i] : null,
            i == decimalIndex.toDouble().round()
                ? widget.activeTextStyle
                : widget.inActiveTextStyle,
            i,
            widget.duration,
          ),
      ],
    );
  }

  Widget buildSwitchTab(
    bool isLeft,
    String title,
    Widget? prefixIcon,
    TextStyle style,
    int toggleIndex,
    Duration duration,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (!moving) {
          moving = true;
          moveToNewIndex(newIndex: toggleIndex, duration: duration);
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding,
            vertical: widget.verticalPadding / 2),
        height: widget.activeButtonHeight +
            (widget.verticalPadding / (decimalIndex.toDouble().round() + 1)),
        child: Row(
          mainAxisAlignment: widget.showSideLine
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            if (widget.prefixIcons != null) prefixIcon!,
            if (widget.prefixIcons != null)
              SizedBox(
                width: widget.spaceBetweenIconAndText,
              ),
            AnimatedDefaultTextStyle(
              duration: duration +
                  Duration(milliseconds: duration.inMilliseconds ~/ 6),
              curve: Curves.easeInOut,
              style: style,
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void moveToNewIndex({required int newIndex, required Duration duration}) {
    Duration oneSec = Duration(milliseconds: duration.inMilliseconds ~/ 6);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (decimalIndex.toDouble() == newIndex) {
            timer.cancel();
          } else if (decimalIndex.toDouble() < newIndex) {
            decimalIndex += Decimal.parse("0.1");
          } else {
            decimalIndex -= Decimal.parse("0.1");
          }

          if (widget.onChange != null) {
            if (decimalIndex.toDouble() < newIndex) {
              widget.onChange!(decimalIndex.toDouble().floor());
            } else {
              widget.onChange!(decimalIndex.toDouble().ceil());
            }
          }
          if (!timer.isActive) {
            moving = false;
          }
        });
      },
    );
  }
}
