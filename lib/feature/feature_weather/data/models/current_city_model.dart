import 'package:bloc_clean_code/feature/feature_weather/domain/entities/current_city_entity.dart';

/// coord : {"lon":-94.04,"lat":33.44}
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]
/// base : "stations"
/// main : {"temp":302.48,"feels_like":305.27,"temp_min":299.4,"temp_max":304.19,"pressure":1012,"humidity":63}
/// visibility : 10000
/// wind : {"speed":4.12,"deg":160}
/// clouds : {"all":0}
/// dt : 1691994792
/// sys : {"type":2,"id":62880,"country":"US","sunrise":1692013069,"sunset":1692061448}
/// timezone : -18000
/// id : 4133367
/// name : "Texarkana"
/// cod : 200

class CurrentCityModel extends CurrentCityEntity {
  CurrentCityModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  }) : super(
            coord: coord,
            weather: weather,
            base: base,
            main: main,
            visibility: visibility,
            wind: wind,
            clouds: clouds,
            dt: dt,
            sys: sys,
            timezone: timezone,
            id: id,
            name: name,
            cod: cod);

  factory CurrentCityModel.fromJson(dynamic json) {
    List<Weather> weather = [];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }

    return CurrentCityModel(
        coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
        weather: weather,
        base: json['base'],
        main: json['main'] != null ? Main.fromJson(json['main']) : null,
        visibility: json['visibility'],
        wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
        clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
        dt: json['dt'],
        sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
        timezone: json['timezone'],
        id: json['id'],
        name: json['name'],
        cod: json['cod']);
  }

  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  num? dt;
  Sys? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['visibility'] = visibility;
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }
}

/// type : 2
/// id : 62880
/// country : "US"
/// sunrise : 1692013069
/// sunset : 1692061448

class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  Sys.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  num? type;
  num? id;
  String? country;
  num? sunrise;
  num? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

/// all : 0

class Clouds {
  Clouds({
    this.all,
  });

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }

  num? all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
}

/// speed : 4.12
/// deg : 160

class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  num? speed;
  num? deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }
}

/// temp : 302.48
/// feels_like : 305.27
/// temp_min : 299.4
/// temp_max : 304.19
/// pressure : 1012
/// humidity : 63

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    return map;
  }
}

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01n"

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  num? id;
  String? main;
  String? description;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

/// lon : -94.04
/// lat : 33.44

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  double? lon;
  double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}
