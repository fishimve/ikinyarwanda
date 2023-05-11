import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AppBarLeadingWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const AppBarLeadingWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Platform.isIOS
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.onPrimary,
      icon: Icon(
        Icons.adaptive.arrow_back,
        size: 25,
      ),
      onPressed: onPressed,
    );
  }
}
