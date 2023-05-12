import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 3,
    minLaunches: 10,
    remindDays: 4,
    remindLaunches: 8,
  );

  void initializeRateMyApp(BuildContext context) {
    _rateMyApp.init().then(
      (_) {
        if (_rateMyApp.shouldOpenDialog) {
          _rateMyApp.showStarRateDialog(
            context,
            title: 'Ikinyarwanda',
            message: 'Nimba iyi porogaramu uyikunda, wayiha amanota?',
            ignoreNativeDialog: false,
            actionsBuilder: (context, stars) => [
              TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  await _rateMyApp
                      .callEvent(RateMyAppEventType.rateButtonPressed);
                  Navigator.pop<RateMyAppDialogButton>(
                    context,
                    RateMyAppDialogButton.rate,
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }
}
