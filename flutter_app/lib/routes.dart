import 'package:example_flutter/ui/home/home_ui.dart';
import 'package:example_flutter/ui/login/login.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => new LogInPage(),
  '/home': (BuildContext context) => new HomeScreen(),
};
