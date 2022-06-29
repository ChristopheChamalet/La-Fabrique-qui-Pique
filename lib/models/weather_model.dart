
class WeatherResponse {
 final  String cityName;
 final TemperatureInfo tempInfo;
 final WeatherInfo weatherInfo;
 final CountryInfo countryInfo;

 String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }
WeatherResponse({required this.cityName , required this.tempInfo , required this.weatherInfo , required this.countryInfo});

 factory WeatherResponse.fromJson(Map<String, dynamic> json) {
   final cityName = json['name'];
   final tempInfoJson = json['main'];
   final tempInfo = TemperatureInfo.fromJson(tempInfoJson);
    final weatherinfoJson = json ['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherinfoJson);
    final sysInfoJson = json['sys'];
    final sysInfo = CountryInfo.fromJson(sysInfoJson);


   return WeatherResponse(cityName: cityName , tempInfo: tempInfo , weatherInfo: weatherInfo, countryInfo: sysInfo);
}
}

class TemperatureInfo {
  final double temperature;


  TemperatureInfo({ required this.temperature});

  factory TemperatureInfo.fromJson(Map<String , dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class HumidityInfo {
  final double humidity;

  HumidityInfo({required this.humidity});

  factory HumidityInfo.fromJson(Map<String , dynamic> json ) {
    final humidity = json["humidity"];
    return HumidityInfo(humidity: humidity);
    
  }
  
}

class CountryInfo {
  final String country;
  CountryInfo({required this.country});

  factory CountryInfo.fromJson(Map< String, dynamic> json) {
    final country = json['country'];
    return CountryInfo(country: country);
  }
}

class WeatherInfo {
  final String description;
  final String icon;
  WeatherInfo({required this.description , required this.icon});

  factory WeatherInfo.fromJson(Map<String , dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description , icon: icon);
  }
}