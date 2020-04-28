import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const APIKey = 'f16ce15acf362f09adce1f4658b92010';
const owmURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(cityName) async {

    NetworkHelper networkHelper = NetworkHelper('$owmURL?q=$cityName&appid=$APIKey&units=metric');
    var networkData = await networkHelper.getData();

    return networkData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$owmURL?lat=${location.lat}&lon=${location.lon}&appid=$APIKey&units=metric');
    var networkData = await networkHelper.getData();

    return networkData;
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
