import 'package:flutter/material.dart';
import 'package:internee_pk/profile_screen.dart';
import 'login_screen.dart';
import 'main_screen.dart';
import 'home_screen.dart';
import 'explore_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internee.pk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => LoginScreen(),
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}