
import 'package:bloc_clean_code/feature/feature_bookmark/domain/entities/city_entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class CityDao{
  @Query("select * from city")
  Future<List<City>> getAllCity();

  @Query("select * from city where name = :name")
  Future<City?> findCityByName(String name);

  @insert
  Future<void> insertCity(City city);

  @Query("delete from city where name = :name")
  Future<void> deleteCityByName(String name);
}