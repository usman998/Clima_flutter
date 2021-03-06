import '../services/location.dart';
import '../services/networking.dart';

const APIkey = '8dcf2f5e718575040563de1034de3823';

class WeatherModel {
  Future<dynamic> getCityWeather(dynamic cityName) async {
    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$APIkey&units=metric');
    var result = await network.getloc();
    return result;
  }

  Future<dynamic> getWeatherLocation() async {
    location currLoc = location();
    await currLoc.getCurrentLocation();
    NetworkHelper network = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${currLoc.latitude}&lon=${currLoc.longitude}&appid=$APIkey&units=metric');
    var result = await network.getloc();
    return result;
    // print(result);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
