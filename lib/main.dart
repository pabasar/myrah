import 'package:flutter/material.dart';
import 'package:myrah/constants.dart';
import 'package:myrah/login.dart';
import 'package:myrah/sign_up.dart';
import 'package:myrah/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_signin_button/button_builder.dart';

/*

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
        '/login': (context) => SignInPage(),
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
      home: SignInPage(),
    );
  }
}

 */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyrahOnline());
}

class MyrahOnline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/login': (context) => SignInPage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/signUp': (context) => RegisterPage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/home': (context) => HomeScreen(),
        },

        title: 'Myrah',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'WorkSans',
        ),
        home: SignInPage(),
    );

  }
}

class AuthTypeSelector extends StatelessWidget {
  // Navigates to a new page
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Myrah"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.indigo,
              text: 'Registration',
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.verified_user,
              backgroundColor: Colors.orange,
              text: 'Sign In',
              onPressed: () => _pushPage(context, SignInPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}