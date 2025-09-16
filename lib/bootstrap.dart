import 'package:flutter/widgets.dart';
import 'package:tea_challenge/app/dependencies/locator.dart';

Future<void> bootstrap(Widget Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await MainLocator().setup();

  runApp(builder());
}
