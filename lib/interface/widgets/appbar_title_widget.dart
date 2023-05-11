import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'text_widget.dart';

class AppBarTitleWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  const AppBarTitleWidget({Key? key, this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: TextWidget.headline1(
        title,
        color: Platform.isIOS
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
