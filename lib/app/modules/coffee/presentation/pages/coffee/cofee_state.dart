import 'package:flutter/material.dart';
import '../../../domain/entities/coffe_image_entity.dart';

class CoffeeState {
  final CoffeeImageEntity image;
  final Color? backgroundColor;
  CoffeeState({required this.image, this.backgroundColor});

  CoffeeState copyWith({CoffeeImageEntity? image, Color? backgroundColor}) {
    return CoffeeState(
      image: image ?? this.image,
      backgroundColor: backgroundColor,
    );
  }
}
