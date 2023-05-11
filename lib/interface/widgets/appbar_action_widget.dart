import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AppBarActionWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  const AppBarActionWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Platform.isIOS
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.onPrimary,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
