import 'package:flutter/material.dart';

class AnimatedToggle extends StatefulWidget {
  AnimatedToggle(
      {Key? key,
      required this.taps,
      required this.width,
      required this.height,
      required this.duration,
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
      this.underLineHeight = 1,
      this.activeUnderLineHeight = 2,
      this.onChange,
      this.underLineColor = Colors.grey,
      this.activeUnderLineColor = Colors.black,
      this.showUnderLine = false,
      this.showActiveButtonColor = true,
      this.local = 'en'})
      : super(key: key);

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

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
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
                              ? index
                              : (widget.taps.length - index - 1)) /
                          (widget.taps.length - 1) *
                          (2 - (widget.horizontalPadding / 100))) -
                      1 +
                      ((widget.horizontalPadding / 2) / 100),
                  0),
              duration: widget.duration,
              child: Container(
                width: (widget.width / widget.taps.length) -
                    widget.horizontalPadding,
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
          if (widget.showUnderLine)
            Container(
              height: widget.underLineHeight,
              color: widget.underLineColor,
            ),
          if (widget.showUnderLine)
            AnimatedAlign(
              alignment: Alignment(
                  ((widget.local == 'en'
                              ? index
                              : (widget.taps.length - index - 1)) /
                          (widget.taps.length - 1) *
                          (2 - (widget.horizontalPadding / 100))) -
                      1 +
                      ((widget.horizontalPadding / 2) / 100),
                  0),
              duration: widget.duration,
              child: Container(
                width: (widget.width / widget.taps.length) -
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < widget.taps.length; i++)
                  buildSwitchTab(
                    i == index,
                    widget.taps[i],
                    i == index
                        ? widget.activeTextStyle
                        : widget.inActiveTextStyle,
                    i,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchTab(
    bool isLeft,
    String title,
    TextStyle style,
    int toggleIndex,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          index = toggleIndex;
        });
        if (widget.onChange != null) {
          widget.onChange!(index);
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding / 2,
            vertical: widget.verticalPadding),
        width: (widget.width / widget.taps.length) -
            (widget.horizontalPadding * widget.taps.length),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }
}
