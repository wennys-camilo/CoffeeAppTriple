import 'dart:ui';
import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../repositories/background_color_repository.dart';
import 'get_color_background_usecase.dart';

class GetColorBackgroundUsecaseImpl implements GetColorBackgroundUsecase {
  final BackgroundColorRepository _colorRepository;
  const GetColorBackgroundUsecaseImpl(this._colorRepository);

  @override
  Future<Either<Failure, Color>> call(String image) async {
    return await _colorRepository.fetchColor(image);
  }
}
