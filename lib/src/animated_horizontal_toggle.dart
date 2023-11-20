import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class AnimatedHorizontalToggle extends StatefulWidget {
  const AnimatedHorizontalToggle(
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
      this.inActiveColor = Colors.transparent,
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
        this.spaceBetween = 0,
      this.horizontalPadding = 4,
      this.verticalPadding = 4,
      this.activeHorizontalPadding = 0,
      this.activeVerticalPadding = 0,
      this.radius = 14,
      this.activeButtonRadius = 14,
      this.inActiveButtonRadius = 0,
      this.underLineHeight = 1,
      this.activeUnderLineHeight = 2,
      this.onChange,
      this.underLineColor = Colors.grey,
      this.activeUnderLineColor = Colors.black,
      this.showUnderLine = false,
      this.showActiveButtonColor = true,
        this.activeBorder,
        this.inActiveBorder,
        this.activeBoxShadow,
        this.inActiveBoxShadow,
      this.local = 'en',
      });

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

  /// - InActive button color
  final Color inActiveColor;

  /// - The color of the underline
  final Color underLineColor;

  /// - The color of the active underline
  final Color activeUnderLineColor;

  /// - Text style for the active button
  final TextStyle activeTextStyle;

  /// - Text style for the inActive button
  final TextStyle inActiveTextStyle;

  /// - The space between the buttons
  final double spaceBetween;

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

  /// - Control the underline height
  final double underLineHeight;

  /// - Control the active underline height
  final double activeUnderLineHeight;

  /// - This radius will use for the active button
  final double activeButtonRadius;

  /// - This radius will use for the inActive button
  final double inActiveButtonRadius;

  /// - OnChange function will give you stream of int number
  /// - This number will change when the index change
  /// - If you press on the button number 3 and the index now is zero so the index will start from 0 and will be 1 and stop in 2 like this will give you the moving steps to make the moving smooth and the screen widgets changing with the moving for the toggle
  final Function(int index)? onChange;

  /// - If this true the underline will be active
  final bool showUnderLine;

  /// - If this true the active underline will be active
  final bool showActiveButtonColor;

  /// - If this 'en' the toggle will start from left to right and if this 'ar' the toggle will start from right to left
  final String local;

  /// - Here if you need to use specific icon before the text button name
  final List<Widget>? prefixIcons;

  /// - If this true the prefix icon will shown
  final bool showPrefixIcon;

  /// - Handel the space between the prefix icon and the text
  final double spaceBetweenIconAndText;

  /// - Handle the shadow for active button
  final List<BoxShadow>? activeBoxShadow;

  /// - Handle the shadow for inActive button
  final List<BoxShadow>? inActiveBoxShadow;

  /// - Handle the border for active button
  final Border? activeBorder;

  /// - Handle the border for inActive button
  final Border? inActiveBorder;

  @override
  State<AnimatedHorizontalToggle> createState() =>
      _AnimatedHorizontalToggleState();
}

class _AnimatedHorizontalToggleState extends State<AnimatedHorizontalToggle>
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
        alignment: Alignment.bottomCenter,
        children: [
          if (widget.showActiveButtonColor)
            AnimatedAlign(
              alignment: Alignment(
                  ((widget.local == 'en'
                              ? decimalIndex.toDouble()
                              : (widget.taps.length -
                                  decimalIndex.toDouble() -
                                  1)) /
                          (widget.taps.length - 1) *
                          (2 - ((widget.horizontalPadding) / 100))) -
                      1 +
                      ((widget.horizontalPadding / 2) / 100),
                  0),
              duration: widget.duration,
              child: Container(
                width: ((widget.width - widget.spaceBetween) / widget.taps.length) -
                    widget.horizontalPadding,
                margin: EdgeInsets.symmetric(
                    vertical: widget.activeVerticalPadding,
                    horizontal: widget.activeHorizontalPadding),
                decoration: BoxDecoration(
                  color: widget.activeColor,
                  borderRadius:
                      BorderRadius.circular(widget.activeButtonRadius),
                  border: widget.activeBorder,
                  boxShadow: widget.activeBoxShadow,
                ),
              ),
            ),
          if (widget.showUnderLine)
            Container(
              height: widget.underLineHeight,
              color: widget.underLineColor,
            ),
          if (widget.showUnderLine)
            AnimatedAlign(
              alignment: Alignment(
                  ((widget.local == 'en'
                              ? decimalIndex.toDouble()
                              : (widget.taps.length -
                                  decimalIndex.toDouble() -
                                  1)) /
                          (widget.taps.length - 1) *
                          (2 - (widget.horizontalPadding / 100))) -
                      1 +
                      ((widget.horizontalPadding / 2) / 100),
                  0),
              duration: widget.duration,
              child: Container(
                width: ((widget.width - widget.spaceBetween) / widget.taps.length) -
                    widget.horizontalPadding,
                height: widget.activeUnderLineHeight,
                margin: EdgeInsets.only(
                  top: widget.height -
                      (widget.activeUnderLineHeight - widget.underLineHeight),
                ),
                decoration: BoxDecoration(
                  color: widget.activeUnderLineColor,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < widget.taps.length; i++)
          buildSwitchTab(
            i == (i.toDecimal() < decimalIndex? decimalIndex.toDouble().floor() :decimalIndex.toDouble().round()),
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
            horizontal: widget.horizontalPadding / 2,
            vertical: widget.verticalPadding),
        width: ((widget.width - widget.spaceBetween) / widget.taps.length) -
            (widget.horizontalPadding * widget.taps.length),
        decoration: BoxDecoration(
          color: (decimalIndex.round()) != toggleIndex.toDecimal()? widget.inActiveColor : Colors.transparent,
          borderRadius:
          BorderRadius.circular(widget.inActiveButtonRadius),
          border: (decimalIndex.round()) != toggleIndex.toDecimal()? widget.inActiveBorder : null,
          boxShadow: (decimalIndex.round()) != toggleIndex.toDecimal()? widget.inActiveBoxShadow : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.prefixIcons != null) prefixIcon!,
            if (widget.prefixIcons != null)
              SizedBox(
                width: widget.spaceBetweenIconAndText,
              ),
            AnimatedDefaultTextStyle(
              duration: duration,
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
    Duration oneSec = Duration(milliseconds: duration.inMilliseconds ~/ 5);
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
