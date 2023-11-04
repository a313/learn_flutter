import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:widgets/injection.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //start
  await Firebase.initializeApp();
  await DependecyInjection.injection();
  //end
  await Future.delayed(Duration(seconds: 5));
  runApp(const App());
}
