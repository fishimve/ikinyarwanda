import 'package:flutter/material.dart';
import 'package:ikinyarwanda/models/inkuru.dart';

import 'text_widget.dart';

class InkuruSummaryWidget extends StatelessWidget {
  final Inkuru inkuru;

  const InkuruSummaryWidget({
    Key? key,
    required this.inkuru,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final summary = inkuru.content.length < 80
        ? inkuru.content
        : inkuru.content.substring(0, 80).endsWith('\n')
            ? inkuru.content.substring(0, 79) + '\u2026\u0020'
            : inkuru.content.substring(0, 80) + '\u2026\u0020';
    return Card(
      elevation: 0,
      shape: null,
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextWiget.headline3(inkuru.title),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextWiget.body(summary),
            ),
          ),
          if (inkuru.author != '')
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextWiget.caption(inkuru.author),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextWiget.caption(inkuru.tags.join(', ')),
            ),
          ),
        ],
      ),
    );
  }
}
