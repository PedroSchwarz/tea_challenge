import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/app/dependencies/locator.dart';
import 'package:tea_challenge/features/entries/entries.dart';

Future<void> bootstrap(Widget Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await MainLocator().setup();

  // Initialize seed data if needed
  try {
    final seedRepository = getIt<EntriesSeedRepository>();
    await seedRepository.initializeSeedDataIfNeeded();
  } catch (e, s) {
    // Log error but don't crash the app
    Logger('Bootstrap').severe('Error initializing seed data', e, s);
  }

  runApp(builder());
}
