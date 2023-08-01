import 'package:archteture/repositories/dependencies/home_repository.dart';
import 'package:archteture/repositories/dependencies/register_repository.dart';
import 'package:archteture/viewModels/home_store.dart';
import 'package:archteture/viewModels/register_store.dart';
import 'package:archteture/views/home.dart';
import 'package:archteture/views/register.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => HomeStore(HomeRepository()), onDispose: (_) => dispose()),
    Bind.singleton((i) => RegisterStore(RegisterRepository())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const Home()),
    ChildRoute('/register', child: (context, args) => const Register())
  ];
}