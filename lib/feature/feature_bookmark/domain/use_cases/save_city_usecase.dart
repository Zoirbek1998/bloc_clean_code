
import '../../../../core/resources/data_state.dart';

import '../../../../core/use_case/use_case.dart';
import '../entities/city_entities.dart';
import '../repository/city_repository.dart';

class SaveCityUseCase implements UseCase<DataState<City>, String>{
  final CityRepository _cityRepository;
  SaveCityUseCase(this._cityRepository);

  @override
  Future<DataState<City>> call(String params) {
    return _cityRepository.saveCityToDB(params);
  }
}