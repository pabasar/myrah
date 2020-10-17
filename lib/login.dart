// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'sign_up.dart';
import 'package:myrah/screens/home/home_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

/// Entrypoint example for various sign-in flows with Firebase.
class SignInPage extends StatefulWidget {
  /// The page title.
  final String title = 'Sign In & Out';

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Builder(builder: (BuildContext context) {
        return ListView(
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _EmailPasswordForm(),

          ],
        );
      }),
    );
  }

  // Example code for sign out.
  void _signOut() async {
    await _auth.signOut();
  }
}

final logo = Hero(
  tag: 'Myrah',
  child: CircleAvatar(
    backgroundColor: Colors.transparent,
    radius: 48.0,
    child: Image.asset('assets/images/myrah_logo.png',width: 400.0,),
  ),
);

final forgot = FlatButton(
  child: Text(
    'Forgot Password?',
    style: TextStyle(color: Colors.brown[700]),
  ),
  onPressed: () {},
);

class _EmailPasswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<_EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  /*
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: const Text(
                    'Sign in with email and password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.center,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (String value) {
                    if (value.isEmpty) return 'Please enter some text';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (String value) {
                    if (value.isEmpty) return 'Please enter some text';
                    return null;
                  },
                  obscureText: true,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.center,
                  child: SignInButton(
                    Buttons.Email,
                    text: "Sign In",
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _signInWithEmailAndPassword();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

   */

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
        alignment: Alignment.center,


    child: ListView(
    shrinkWrap: true,
    padding: EdgeInsets.only(left: 24.0, right: 24.0),
    children: <Widget>[
      SizedBox(height: 180),
    logo,
    SizedBox(height: 48.0),

      TextFormField(
          validator: (String value) {
            if (value.isEmpty) return 'Please enter your email';
            return null;
          },
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(color: Colors.brown[700]),
          autofocus: false,
          initialValue: "",
          cursorColor: Color(0xFFe8a317),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email,color: Color(0xFFe8a317),),
            prefixStyle: const TextStyle(color: Colors.brown),
            suffixStyle: const TextStyle(color: Colors.brown),
            hintText: 'johnsmith@mail.com',
            hintStyle: TextStyle(color: Colors.brown[300]),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
              borderSide: new BorderSide(color: Color(0xFFe8a317)),
            ),
          )),

    SizedBox(height: 8.0),

      TextFormField(
          validator: (String value) {
            if (value.isEmpty) return 'Please enter your password';
            return null;
          },
          controller: _passwordController,
          style: new TextStyle(color: Colors.brown[700]),
          autofocus: false,
          initialValue: '',
          cursorColor: Color(0xFFe8a317),
          obscureText: true,
          decoration: InputDecoration(
            focusColor: Color(0xFFe8a317),
            prefixIcon: Icon(Icons.lock,color: Color(0xFFe8a317)),
            prefixStyle: const TextStyle(color: Colors.brown),
            suffixStyle: const TextStyle(color: Colors.brown),
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.brown[300]),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
              borderSide: new BorderSide(color: Color(0xFFe8a317)),
            ),
          )),

    SizedBox(height: 18.0,),
    forgot,

    RaisedButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
    ),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          _signInWithEmailAndPassword();
        }
      },
    padding: EdgeInsets.all(12),
    color: Color(0xFFe8a317),
    child: Text('Sign In', style: TextStyle(color: Colors.white)),
    ),
    FlatButton(
    child: Text(
    'New to Myrah? Sign Up',
    style: TextStyle(color: Colors.brown[700]),
    ),
    onPressed: () {
    Navigator.pushNamed(context, '/signUp');
    },
    ),
    ],
    ),
    ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code of how to sign in with email and password.
  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${user.email} Signed In"),
      ));
      Navigator.pushNamed(context, '/home');

    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Wrong Email or Password"),
      ));
    }
  }
}
