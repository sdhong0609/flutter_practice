import 'package:flutter/material.dart';
import 'package:flutter_practice/data/my_location.dart';
import 'package:flutter_practice/data/network.dart';
import 'package:flutter_practice/screens/weather_screen.dart';

const apiKey = 'be9e9cf3f1cad537c39c966d21dd9d5c';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double latitude3 = 0.0;
  double longitude3 = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
      );
    }));
  }

  // void fetchData() async {
  //
  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //
  //     var wind = parsingData['wind']['speed'];
  //     print(wind);
  //
  //     var id = parsingData['id'];
  //     print(id);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: null,
          child: Text(
            'Get my location',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
