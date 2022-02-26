import 'dart:ui';
import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class BackgroundColorRepository {
  Future<Either<Failure, Color>> fetchColor(String image);
}
