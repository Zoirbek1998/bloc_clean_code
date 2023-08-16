import 'package:bloc_clean_code/core/resources/data_state.dart';

import 'package:bloc_clean_code/feature/feature_bookmark/domain/entities/city_entities.dart';

import '../../domain/repository/city_repository.dart';
import '../data_source/local/city_dao.dart';

class CityRepositoryImpl extends CityRepository{
  CityDao cityDao;
  CityRepositoryImpl(this.cityDao);

  @override
  Future<DataState<String>> deleteCityByName(String name) async{
    try{
      await cityDao.deleteCityByName(name);
      return DataSuccess(name);
    }catch(e){
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

  /// call  get city by name from DB and set status
  @override
  Future<DataState<City?>> findCityByName(String name)async {
    try{
      City? city =  await cityDao.findCityByName(name);
      return DataSuccess(city);
    }catch(e){
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<City>>> getAllCityFromDB() async{
    try{
      List<City> cities =  await cityDao.getAllCity();
      return DataSuccess(cities);
    }catch(e){
      return DataFailed(e.toString());
    }
  }

  /// call save city to DB and set status
  @override
  Future<DataState<City>> saveCityToDB(String cityName) async{
    try{

      // check city exist or not
      City? checkCity = await cityDao.findCityByName(cityName);
      if(checkCity != null){
        return DataFailed("$cityName has Already exist");
      }

      // insert city to database
      City city = City(name: cityName);
      await cityDao.insertCity(city);
      return DataSuccess(city);

    }catch(e){
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

}