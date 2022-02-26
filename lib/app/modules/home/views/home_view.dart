import 'package:analog_clock_test/app/modules/home/views/alarm_set_widget.dart';
import 'package:analog_clock_test/app/modules/home/views/analog_clock_widget.dart';
import 'package:analog_clock_test/constants/colors.dart';
import 'package:analog_clock_test/shared/widget/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'title.analog.clock'.tr,
      ),
      body: SingleChildScrollView(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return [
      AnalogClockWidget(
        dialPlateColor: ColorsCustom.white,
        hourHandColor: ColorsCustom.black,
        minuteHandColor: ColorsCustom.black,
        secondHandColor: ColorsCustom.red,
        numberColor: ColorsCustom.black,
        borderColor: ColorsCustom.black3,
        tickColor: ColorsCustom.black,
        centerPointColor: ColorsCustom.black5,
        showBorder: true,
        showTicks: true,
        showMinuteHand: true,
        showSecondHand: true,
        showNumber: true,
        borderWidth: 15,
        hourNumberScale: 1,
        width: 200.0,
        height: 200.0,
        decoration: const BoxDecoration(),
      ).center().padding(top: 100, bottom: 10),
      Text('title.analog.clock'.tr).padding(bottom: 30),
      AlarmSetWidget(),
    ].toColumn(crossAxisAlignment: CrossAxisAlignment.center);
  }
}
