// import 'package:flutter/material.dart';

// class WeatherModel {
//   DateTime date;
//   double temp;
//   double maxTemp;
//   double minTemp;
//   String weatherStateName;

//   WeatherModel(
//       {required this.date,
//       required this.temp,
//       required this.maxTemp,
//       required this.minTemp,
//       required this.weatherStateName});

//   factory WeatherModel.fromJson(dynamic data) {
//     var jsonData = data['forecast']['forecastday'][0]['day'];

//     return WeatherModel(
//         date: DateTime.parse( data['current']['last_updated']),
//         temp: jsonData['avgtemp_c'],
//         maxTemp: jsonData['maxtemp_c'],
//         minTemp: jsonData['mintemp_c'],
//         weatherStateName: jsonData['condition']['text']);
//   }

//   @override
//   String toString() {
//     return 'tem = $temp  minTemp = $minTemp  date = $date';
//   }

//  String getImage() {
//   if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
//     return 'assets/images/clear.png';
//   } else if (

//       weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
//     return 'assets/images/snow.png';
//   } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
//     return 'assets/images/cloudy.png';
//   } else if (weatherStateName == 'Patchy rain possible' ||
//       weatherStateName == 'Heavy Rain' ||
//       weatherStateName == 'Showers	') {
//     return 'assets/images/rainy.png';
//   } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
//     return 'assets/images/thunderstorm.png';
//   } else {
//     return 'assets/images/clear.png';
//   }
// }
// MaterialColor getThemeColor() {
//     if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
//       return Colors.orange;
//     } else if (

//         weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
//       return Colors.blue;
//     } else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog') {
//       return Colors.blueGrey;
//     } else if (weatherStateName == 'Patchy rain possible' ||
//         weatherStateName == 'Heavy Rain' ||
//         weatherStateName == 'Showers	') {
//       return Colors.blue;
//     } else if (weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' ) {
//       return Colors.deepPurple;
//     } else {
//       return Colors.orange;
//     }
//   }

// }

import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  String weatherStat;
  String weatherIcon;
  double maxTemp;
  double minTemp;
  double temp;
  WeatherModel(
      {required this.date,
      required this.weatherStat,
      required this.weatherIcon,
      required this.temp,
      required this.maxTemp,
      required this.minTemp});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        weatherStat: jsonData['condition']['text'],
        weatherIcon: jsonData['condition']['icon'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }
  MaterialColor getThemeColor() {
    if (weatherStat == 'Sunny' ||
        weatherStat == 'Clear' ||
        weatherStat == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStat == 'Blizzard' ||
        weatherStat == 'Patchy snow possible' ||
        weatherStat == 'Patchy sleet possible' ||
        weatherStat == 'Patchy freezing drizzle possible' ||
        weatherStat == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStat == 'Freezing fog' ||
        weatherStat == 'Fog' ||
        weatherStat == 'Heavy Cloud' ||
        weatherStat == 'Mist' ||
        weatherStat == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStat == 'Patchy rain possible' ||
        weatherStat == 'Heavy Rain' ||
        weatherStat == 'Showers' ||
        weatherStat == 'Overcast') {
      return Colors.blue;
    } else if (weatherStat == 'Thundery outbreaks possible' ||
        weatherStat == 'Moderate or heavy snow with thunder' ||
        weatherStat == 'Patchy light snow with thunder' ||
        weatherStat == 'Moderate or heavy rain with thunder' ||
        weatherStat == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }

  @override
  String toString() {
    return '{$date $temp $weatherStat}';
  }
}
