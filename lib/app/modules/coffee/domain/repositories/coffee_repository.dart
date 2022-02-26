import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/coffe_image_entity.dart';

abstract class CoffeeRepository {
  Future<Either<Failure, CoffeeImageEntity>> fetchImage();
}
