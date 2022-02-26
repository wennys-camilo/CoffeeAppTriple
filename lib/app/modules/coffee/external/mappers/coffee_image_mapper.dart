import '../../domain/entities/coffe_image_entity.dart';

class CoffeeImageMapper {
  CoffeeImageEntity toMap(Map<String, dynamic> map) {
    return CoffeeImageEntity(
      image: map['file'] ?? '',
    );
  }
}
