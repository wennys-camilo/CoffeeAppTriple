import 'package:coffee_app/app/modules/coffee/coffee_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind((i) => Dio())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: CoffeeModule()),
  ];
}
