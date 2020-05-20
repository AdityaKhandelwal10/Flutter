

import 'package:flutter/material.dart';
import 'package:worldmap/pages/choose_location.dart';
import 'package:worldmap/pages/home.dart';
import 'package:worldmap/pages/loading.dart';

void main() => runApp(MaterialApp(
  //home: Home(),
  initialRoute: '/',
  routes: {
    '/': (context)=> Loading(),
    '/home':(context)=> Home(),
    '/location' : (context) => ChooseLocation(),

  },
));


