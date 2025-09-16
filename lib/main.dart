import 'package:tea_challenge/app/ui/app.dart';
import 'package:tea_challenge/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() {
    return const MainApp();
  });
}
