import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

const APIkey = '8dcf2f5e718575040563de1034de3823';

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print('this code is triggered');
    getLocationData();
  }

  WeatherModel model = WeatherModel();

  void getLocationData() async {
    var result = await model.getWeatherLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(result);
    }));
    print(result["name"]);
  }

  // void getloc() async {
  //   var url = Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$APIkey');
  //   http.Response response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     var data1 = jsonDecode(data)["weather"][0]['id'];
  //     var data2 = jsonDecode(data)["main"]["temp"];
  //     print(data1);
  //     print(data2);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
