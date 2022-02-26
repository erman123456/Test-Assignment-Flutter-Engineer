import 'package:analog_clock_test/app/modules/home/controllers/home_controller.dart';
import 'package:analog_clock_test/constants/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:styled_widget/styled_widget.dart';

class AlarmSetWidget extends GetView<HomeController> {
  const AlarmSetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      Text(
        'alarm.set'.tr,
        style: TextStyleCustom.h6Bold,
      ).padding(vertical: 10),
      Obx(
        () => Visibility(
            visible: controller.isAlarmSet.value,
            child: [
              Divider(),
              [
                _textDefault(controller.hour.toString()),
                _textDefault(': ${controller.minute} :'),
                _textDefault(controller.second.toString()),
              ].toRow(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ].toColumn()),
      ),
      Divider(),
      Form(
        key: controller.formKey,
        child: [
          _textFormField(
            textInputType: TextInputType.number,
            labelText: 'label.hour'.tr,
            textEditingController: controller.hourCtrl,
          ),
          _textFormField(
            textInputType: TextInputType.number,
            labelText: 'label.minute'.tr,
            textEditingController: controller.minuteCtrl,
          ).padding(horizontal: 20),
          _textFormField(
            textInputType: TextInputType.number,
            labelText: 'label.second'.tr,
            textEditingController: controller.secondCtrl,
          ),
        ]
            .toRow(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .padding(horizontal: 16)
            .center(),
      ),
      ElevatedButton(
        onPressed: () => controller.alarmSetVoid(),
        child: Text(
          'Set',
          style: TextStyleCustom.caption1,
        ),
      ).padding(top: 10),
    ].toColumn(crossAxisAlignment: CrossAxisAlignment.center);
  }

  Widget _textFormField({
    required String labelText,
    required TextEditingController textEditingController,
    required TextInputType textInputType,
  }) {
    return TextFormField(
      maxLength: 2,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: '00',
        isDense: true,
      ),
      controller: textEditingController,
    ).width(70);
  }

  Widget _textDefault(String value) {
    return Text(
      value,
      style: TextStyleCustom.h2,
    );
  }
}
