import 'package:clima_app/pages/city.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:clima_app/utilites/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({super.key, required this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Weather w = Weather();
  int? temperature;
  String? weathericon;
  String? city;
  String? weathermessage;
  @override
  void initState() {
    super.initState();
    updateui(widget.locationWeather);
  }

  void updateui(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weathericon = "Error";
        city = "";
        weathermessage = "No weatherdata to get";
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weathericon = w.getWeatherIcon(condition);
      city = weatherData['name'];
      weathermessage = w.getMessage(temperature!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Screen"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/weather1.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () async {
                      var weatherData = await w.getLocationWeather();
                      updateui(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    var typedName = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CityScreen()));
                    if (typedName != null) {
                      var weatherData = await w.getCityWeather(typedName);
                      updateui(weatherData);
                    }
                  },
                  child: Icon(
                    Icons.location_city,
                    color: Colors.white,
                    size: 50,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(text: "$temperature°", style: kTextstyle),
                      TextSpan(
                          text: "c",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontFamily: 'Spartan MB'))
                    ]),
                  ),
                  Text(
                    weathericon!,
                    style: kWeatherIcon,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$weathermessage in $city",
                textAlign: TextAlign.right,
                style: kMesseageTextstyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
