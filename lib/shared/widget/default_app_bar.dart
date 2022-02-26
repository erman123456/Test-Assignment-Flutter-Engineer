import 'package:analog_clock_test/constants/colors.dart';
import 'package:analog_clock_test/constants/dimens.dart';
import 'package:analog_clock_test/constants/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color _iconColor;
  final Color _bgColor;
  final Color _textColor;
  final SystemUiOverlayStyle _systemUiOverlayStyle;

  @override
  final Size preferredSize;

  const DefaultAppBar({
    Key? key,
    this.title = '',
    this.preferredSize = const Size.fromHeight(Dimens.appBarHeight),
    bool isDark = false,
  })  : _iconColor = isDark ? ColorsCustom.white : const Color(0xFF25282B),
        _bgColor = isDark ? ColorsCustom.black1 : ColorsCustom.white,
        _textColor = isDark ? ColorsCustom.white : ColorsCustom.black,
        _systemUiOverlayStyle =
            isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: _systemUiOverlayStyle,
      elevation: 1,
      backgroundColor: _bgColor,
      title: Text(
        title,
        style: TextStyleCustom.caption1.copyWith(color: _textColor),
        overflow: TextOverflow.ellipsis,
      ).center(),
    );
  }
}
