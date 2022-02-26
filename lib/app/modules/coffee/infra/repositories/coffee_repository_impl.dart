import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/coffe_image_entity.dart';
import '../../domain/repositories/coffee_repository.dart';
import '../datasources/coffee_remote_datasource.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  final CoffeeRemoteDataSource _remoteDataSource;
  const CoffeeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, CoffeeImageEntity>> fetchImage() async {
    try {
      final response = await _remoteDataSource.fetchImage();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
