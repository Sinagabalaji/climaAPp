import 'package:clima_app/utilites/api.dart';
import 'package:clima_app/utilites/location.dart';

const apiKey = '9358625a896961d082bb257c7d1bd632';

class Weather {
  Future<dynamic> getCityWeather(String cityName) async {
    Network n1 = Network(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await n1.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location l = Location();
    await l.getCurrentLocation();
    Network n = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=${l.latitude}&lon=${l.longitude}&appid=$apiKey&units=metric');
    var weatherData = await n.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
