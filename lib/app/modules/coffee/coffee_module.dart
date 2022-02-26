import 'package:coffee_app/app/modules/coffee/infra/repositories/background_color_repository_impl.dart';
import 'package:coffee_app/app/modules/coffee/presentation/pages/coffee/coffee_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/get_color_background_usecase_impl.dart';
import 'domain/usecases/get_image_coffee_usecase_impl.dart';
import 'external/datasources/coffee_remote_datasource_impl.dart';
import 'infra/repositories/coffee_repository_impl.dart';
import 'presentation/pages/coffee/coffee_page.dart';

class CoffeeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CoffeeRemoteDataSourceImpl(i.get())),
    Bind((i) => CoffeeRepositoryImpl(i.get())),
    Bind((i) => BackgroundColorRepositoryImpl()),
    Bind((i) => GetImageCoffeeUsecaseImpl(i.get())),
    Bind((i) => GetColorBackgroundUsecaseImpl(i.get())),
    Bind.lazySingleton((i) => CoffeeStore(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const CoffePage())
  ];
}
