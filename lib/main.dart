import 'package:flutter/material.dart';
import 'package:myrah/constants.dart';
import 'package:myrah/login.dart';
import 'package:myrah/sign_up.dart';
import 'package:myrah/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => Login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/signUp': (context) => SignUp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => HomeScreen(),
      },

      debugShowCheckedModeBanner: false,
      title: 'Myrah',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'WorkSans',
      ),
      home: Login(),
    );
  }
}
