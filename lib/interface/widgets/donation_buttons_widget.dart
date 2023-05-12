import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';
import 'package:ikinyarwanda/shared/ui_helpers.dart';

class DonationButtonsWidget extends StatelessWidget {
  const DonationButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: PayPalButton(
            paypalButtonId: 'UDU7QDGLBTFAC',
            donationText: 'Nshyigikira kuri PayPal',
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
        Expanded(
          child: KofiButton(
            kofiName: 'fabriceishimwe',
            text: 'Nshyigikira kuri Ko-Fi',
            kofiColor: isDarkMode ? KofiColor.Orange : KofiColor.Blue,
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
    );
  }
}
