import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:coffee_app/app/shared/domain/helpers/errors/failure.dart';
import '../../domain/repositories/background_color_repository.dart';

class BackgroundColorRepositoryImpl implements BackgroundColorRepository {
  @override
  Future<Either<Failure, Color>> fetchColor(String image) async {
    try {
      final response =
          await PaletteGenerator.fromImageProvider(Image.network(image).image);
      return Right(response.dominantColor!.color);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
