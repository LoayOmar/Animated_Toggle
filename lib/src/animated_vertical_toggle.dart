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

  @override
  State<AnimatedVerticalToggle> createState() =>
      _AnimatedVerticalToggleState();
}

class _AnimatedVerticalToggleState extends State<AnimatedVerticalToggle> with TickerProviderStateMixin{
  Decimal decimalIndex = Decimal.parse('0');
  bool addInitialIndex = false;

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
                  0, (decimalIndex.toDouble() /
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
                  -1, (decimalIndex.toDouble() /
                  (widget.taps.length - 1) *
                  (2 - (widget.verticalPadding / 100))) -
                  1 +
                  ((widget.verticalPadding) / 100)),
              duration: widget.duration,
              child: Container(
                height: widget.activeButtonHeight -
                    widget.horizontalPadding,
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
            widget.prefixIcons != null? widget.prefixIcons![i] : null,
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
        moveToNewIndex(newIndex: toggleIndex, duration: duration);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding,
            vertical: widget.verticalPadding / 2),
        height: widget.activeButtonHeight + (widget.verticalPadding / (decimalIndex.toDouble().round() + 1)),
        child: Row(
          mainAxisAlignment: widget.showSideLine? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            if(widget.prefixIcons != null)
              prefixIcon!,

            if(widget.prefixIcons != null)
              SizedBox(width: widget.spaceBetweenIconAndText,),
            AnimatedDefaultTextStyle(
              duration: duration + Duration(milliseconds: duration.inMilliseconds ~/ 6),
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
            if (decimalIndex.toDouble() < newIndex){
              widget.onChange!(decimalIndex.toDouble().floor());
            }else{
              widget.onChange!(decimalIndex.toDouble().ceil());
            }
          }
        });
      },
    );
  }
}
