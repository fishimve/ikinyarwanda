import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';
import 'package:ikinyarwanda/interface/widgets/text_widget.dart';
import 'package:ikinyarwanda/shared/ui_helpers.dart';

class DonationButtonsWidget extends StatelessWidget {
  const DonationButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: basePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const TextWidget.headline3('Nshyigikira'),
          verticalSpaceTiny,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: PayPalButton(
                  paypalButtonId: 'UDU7QDGLBTFAC',
                  donationText: 'PayPal',
                  color: isDarkMode
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimary,
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.all(8),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: isDarkMode
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              horizontalSpaceSmall,
              Flexible(
                child: KofiButton(
                  kofiName: 'fabriceishimwe',
                  text: 'Ko-Fi',
                  kofiColor: KofiColor.Orange,
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.all(8),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: isDarkMode
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
