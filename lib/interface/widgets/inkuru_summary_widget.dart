import 'package:flutter/material.dart';
import 'package:ikinyarwanda/models/inkuru.dart';
import 'package:ikinyarwanda/shared/ui_helpers.dart';

import 'text_widget.dart';

class InkuruSummaryWidget extends StatelessWidget {
  final Inkuru inkuru;
  final bool isFavorite;

  const InkuruSummaryWidget({
    Key? key,
    required this.inkuru,
    required this.isFavorite,
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
          if (inkuru.author != '' || inkuru.tags.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget.caption(
                      inkuru.author == ''
                          ? inkuru.tags.join(', ')
                          : '${inkuru.author} | ${inkuru.tags.join(', ')}',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  if (isFavorite) ...[
                    const TextWidget.caption(' | '),
                    Icon(
                      Icons.bookmark,
                      size: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                  ]
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.headline3(
                inkuru.title,
                align: TextAlign.start,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextWidget.body(summary),
            ),
          ),
        ],
      ),
    );
  }
}
