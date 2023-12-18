import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';

const apiKey = '450dfe19680707fc8096f104812c9d6e';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
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

  String getWeatherImage(int condition) {
    if (condition < 300) {
      return 'assets/images/rain.jpg';
    } else if (condition < 400) {
      return 'assets/images/thunder.jpg';
    } else if (condition < 600) {
      return 'assets/images/rain.jpg';
    } else if (condition < 700) {
      return 'assets/images/snow.jpg';
    } else if (condition < 800) {
      return 'assets/images/rain.jpg';
    } else if (condition == 800) {
      return 'assets/images/sunny.jpg';
    } else if (condition <= 804) {
      return 'assets/images/rain.jpg';
    } else {
      return 'assets/images/sunny.jpg';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Thích hợp để giải khát đấy';
    } else if (temp > 20) {
      return 'Ra ngoài vận động thôi nào';
    } else if (temp < 10) {
      return 'Bạn nên giữ ấm cơ thể';
    } else {
      return 'Lạnh lém';
    }
  }
}
