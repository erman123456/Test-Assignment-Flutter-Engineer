import 'dart:async';

import 'package:analog_clock_test/app/modules/home/controllers/home_controller.dart';
import 'package:analog_clock_test/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:styled_widget/styled_widget.dart';

import 'analog_clock_painter.dart';

/// A analog clock.
class AnalogClockWidget extends GetView<HomeController> {
  final Color dialPlateColor;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;
  final Color numberColor;
  final Color borderColor;
  final Color tickColor;
  final Color centerPointColor;
  final bool showBorder;
  final bool showTicks;
  final bool showMinuteHand;
  final bool showSecondHand;
  final bool showNumber;
  final double borderWidth;
  final double hourNumberScale;
  final List<String> hourNumbers;
  final double width;
  final double height;
  final BoxDecoration decoration;

  const AnalogClockWidget(
      {this.dialPlateColor = ColorsCustom.white,
      this.hourHandColor = ColorsCustom.black,
      this.minuteHandColor = ColorsCustom.black,
      this.secondHandColor = ColorsCustom.black,
      this.numberColor = ColorsCustom.black,
      this.borderColor = ColorsCustom.black,
      this.tickColor = ColorsCustom.black,
      this.centerPointColor = ColorsCustom.black,
      this.showBorder = true,
      this.showTicks = true,
      this.showMinuteHand = true,
      this.showSecondHand = true,
      this.showNumber = true,
      required this.borderWidth,
      this.hourNumberScale = 1.0,
      this.hourNumbers = AnalogClockPainter.defaultHourNumbers,
      this.width = double.infinity,
      this.height = double.infinity,
      this.decoration = const BoxDecoration(),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: Obx(
        () => CustomPaint(
          painter: AnalogClockPainter(
            dateTime: controller.dateTime.value,
            dialPlateColor: dialPlateColor,
            hourHandColor: hourHandColor,
            minuteHandColor: minuteHandColor,
            secondHandColor: secondHandColor,
            numberColor: numberColor,
            borderColor: borderColor,
            tickColor: tickColor,
            centerPointColor: centerPointColor,
            showBorder: showBorder,
            showTicks: showTicks,
            showMinuteHand: showMinuteHand,
            showSecondHand: showSecondHand,
            showNumber: showNumber,
            borderWidth: borderWidth,
            hourNumberScale: hourNumberScale,
            hourNumbers: hourNumbers,
          ),
        ),
      ),
    );
  }
}
