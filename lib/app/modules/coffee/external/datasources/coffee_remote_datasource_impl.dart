import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/coffe_image_entity.dart';
import '../../infra/datasources/coffee_remote_datasource.dart';
import '../mappers/coffee_image_mapper.dart';

class CoffeeRemoteDataSourceImpl implements CoffeeRemoteDataSource {
  final Dio _dio;
  const CoffeeRemoteDataSourceImpl(this._dio);

  @override
  Future<CoffeeImageEntity> fetchImage() async {
    try {
      final Response response =
          await _dio.get('https://coffee.alexflipnote.dev/random.json');
      return CoffeeImageMapper().toMap(response.data);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
