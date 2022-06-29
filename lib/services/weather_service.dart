import 'package:http/http.dart' as http;
import 'package:lafabp/models/weather_model.dart';
import 'dart:convert';

class WeatherDataSerivce {

  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {'q' : city , 'appid': 'ecdfa25f9bbb92f36674b05aa58ba597' , 'units' :'metric' , 'lang':'fr'};

    final url = Uri.https('api.openweathermap.org' , '/data/2.5/weather' , queryParameters);
    final response = await http.get(url);
      final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}