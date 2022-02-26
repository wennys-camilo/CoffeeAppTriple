import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/coffe_image_entity.dart';
import '../repositories/coffee_repository.dart';
import 'get_image_coffee_usecase.dart';

class GetImageCoffeeUsecaseImpl implements GetImageCoffeeUsecase {
  final CoffeeRepository _repository;

  const GetImageCoffeeUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, CoffeeImageEntity>> call() async {
    return await _repository.fetchImage();
  }
}
