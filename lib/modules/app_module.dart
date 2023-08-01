import 'package:archteture/modules/home_module.dart';
import 'package:archteture/views/splash.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SplashScreen()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}