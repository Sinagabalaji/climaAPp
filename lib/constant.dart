import 'package:flutter/material.dart';

const kTextstyle =
    TextStyle(fontSize: 100.0, fontFamily: 'Spartan MB', color: Colors.white);
const kMesseageTextstyle = TextStyle(fontSize: 60, fontFamily: 'Spartan MB');
const kWeatherIcon = TextStyle(fontSize: 80, fontFamily: 'Spartan MB');

const kTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter A City Name ',
    hintStyle: TextStyle(color: Colors.black),
    // labelText: "*City Name",
    // labelStyle: TextStyle(color: Colors.black),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ));
