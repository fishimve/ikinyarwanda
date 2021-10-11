import 'package:flutter/material.dart';
import 'package:ikinyarwanda/shared/ui_helpers.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: basePadding,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            color ?? Theme.of(context).primaryColor,
          ),
          strokeWidth: 5,
        ),
      ),
    );
  }
}
