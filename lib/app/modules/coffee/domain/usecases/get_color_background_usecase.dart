import 'dart:ui';
import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class GetColorBackgroundUsecase {
  Future<Either<Failure, Color>> call(String image);
}
