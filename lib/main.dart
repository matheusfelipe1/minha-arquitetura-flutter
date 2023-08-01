import 'package:archteture/app_widget.dart';
import 'package:archteture/memory_observer.dart';
import 'package:archteture/modules/app_module.dart';
import 'package:archteture/providers/databases/user_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  try {
    await dotenv.load(fileName: kReleaseMode ? '.env.production' : '.env.dev');
  } catch (e) {
    debugPrint(e.toString());
  }
  UserDatabase().start();
  WidgetsBinding.instance.addObserver(MemoryObserver());
  runApp(RestorationScope(
      restorationId: 'root',
      child: ModularApp(module: AppModule(), child: const AppWidget())));
}
