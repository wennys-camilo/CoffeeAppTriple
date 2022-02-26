import '../../domain/entities/coffe_image_entity.dart';

abstract class CoffeeRemoteDataSource {
  Future<CoffeeImageEntity> fetchImage();
}
