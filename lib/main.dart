import 'package:flutter/material.dart';
import 'package:widgets/injection.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //start
  await DependecyInjection.injection();

  //end
  runApp(const App());
}
