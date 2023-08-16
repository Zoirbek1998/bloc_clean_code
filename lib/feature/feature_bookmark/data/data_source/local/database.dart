import 'dart:async';
import 'package:bloc_clean_code/feature/feature_bookmark/data/data_source/local/city_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/entities/city_entities.dart';

part 'database.g.dart';

@Database(version: 1, entities: [City])
abstract class AppDatabase extends FloorDatabase {
  CityDao get cityDao;
}