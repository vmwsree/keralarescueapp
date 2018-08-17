import 'package:flutter/material.dart';
import 'package:keralarescue/help_page.dart';

import 'package:keralarescue/main.dart';
final routes = {
  '/helpneed': (BuildContext context) => new HelpNeeded(),
  '/home': (BuildContext context) => new MyHomePage(title: 'Keral Flood Rescue App'),
  '/': (BuildContext context) => new MyHomePage(title: 'Kerala Flood Rescue App'),
  };