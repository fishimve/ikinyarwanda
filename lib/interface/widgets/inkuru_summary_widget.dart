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
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (inkuru.author != '' || inkuru.tags.isNotEmpty) ...[
              Row(
                children: [
                  TextWidget.caption(
                    inkuru.author == ''
                        ? inkuru.tags.join(', ')
                        : '${inkuru.author} | ${inkuru.tags.join(', ')}',
                    // color: Theme.of(context).primaryColor,
                  ),
                  if (isFavorite) ...[
                    const TextWidget.caption(' | '),
                    const Icon(Icons.bookmark, size: 14),
                  ]
                ],
              ),
              verticalSpaceSmall,
            ],
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.headline3(
                inkuru.title,
                align: TextAlign.start,
              ),
            ),
            verticalSpaceSmall,
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.body(summary),
            ),
          ],
        ),
      ),
    );
  }
}
