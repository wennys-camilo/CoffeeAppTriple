import 'package:flutter_triple/flutter_triple.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../domain/entities/coffe_image_entity.dart';
import '../../../domain/usecases/get_color_background_usecase_impl.dart';
import '../../../domain/usecases/get_image_coffee_usecase_impl.dart';
import 'cofee_state.dart';

class CoffeeStore extends StreamStore<Failure, CoffeeState> {
  final GetImageCoffeeUsecaseImpl _getImageCoffee;
  final GetColorBackgroundUsecaseImpl _getColor;
  CoffeeStore(this._getImageCoffee, this._getColor)
      : super(CoffeeState(image: const CoffeeImageEntity(image: '')));

  Future<void> getImage() async {
    setLoading(true);
    final result = await _getImageCoffee();
    result.fold(setError, (response) async {
      update(state.copyWith(image: response, backgroundColor: null));
      await getColor(response.image);
    });
    setLoading(false);
  }

  Future<void> getColor(String image) async {
    setLoading(true);
    final result = await _getColor(image);
    result.fold(setError,
        (response) => update(state.copyWith(backgroundColor: response)));
    setLoading(false);
  }
}
