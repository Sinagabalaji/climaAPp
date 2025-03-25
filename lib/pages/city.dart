import 'package:clima_app/constant.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController weathercontroller = TextEditingController();
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("City Screen"),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/city.jpeg'),
                  fit: BoxFit.cover)),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: weathercontroller,
                    decoration: kTextFieldDecoration,
                    onChanged: (value) => cityName = value,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    "Get Weather",
                    style: kCityButtonStyle,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
