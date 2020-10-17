import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter/material.dart';
import 'login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

/// Entrypoint example for registering via Email/Password.
class RegisterPage extends StatefulWidget {
  /// The page title.
  final String title = 'Registration';

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _success;
  String _userEmail;

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
          key: _formKey,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: SignInButtonBuilder(
                      icon: Icons.person_add,
                      backgroundColor: Colors.blueGrey,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _register();
                        }
                      },
                      text: 'Register',
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(_success == null
                        ? ''
                        : (_success
                        ? 'Successfully registered ' + _userEmail
                        : 'Registration failed')),
                  )
                ],
              ),
            ),
          )),
    );
  }

   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formKey,
        child: Container(
        alignment: Alignment.center,


    child: ListView(
    shrinkWrap: true,
    padding: EdgeInsets.only(left: 24.0, right: 24.0),
    children: <Widget>[
    logo,
    SizedBox(height: 48.0),

        TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
          keyboardType: TextInputType.text,
          style: new TextStyle(color: Colors.brown[700]),
          autofocus: false,
          initialValue: "",
          cursorColor: Color(0xFFe8a317),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person,color: Color(0xFFe8a317),),
            prefixStyle: const TextStyle(color: Colors.brown),
            suffixStyle: const TextStyle(color: Colors.brown),
            hintText: 'john',
            hintStyle: TextStyle(color: Colors.brown[300]),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
                borderSide: new BorderSide(color: Color(0xFFe8a317))),
          ),
        ),

    SizedBox(height: 8.0),

        TextFormField(
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your email';
              }
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
          if (value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
        controller: _passwordController,
        style: new TextStyle(color: Colors.brown[700]),
        autofocus: false,
        initialValue: '',
        cursorColor: Color(0xFFe8a317),
        obscureText: true,
        decoration: InputDecoration(
          prefixStyle: const TextStyle(color: Colors.brown),
          prefixIcon: Icon(Icons.lock,color: Color(0xFFe8a317)),
          suffixStyle: const TextStyle(color: Colors.brown),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.brown[300]),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
              borderSide: new BorderSide(color: Color(0xFFe8a317))),
        ),
      ),

    SizedBox(height: 18.0,),
    RaisedButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24),
    ),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          _register();
        }
      },
    padding: EdgeInsets.all(12),
    color: Color(0xFFe8a317),
    child: Text('Sign Up', style: TextStyle(color: Colors.white,)),
    ),
    FlatButton(
    child: Text(
    'Already Registered? Sign In',
    style: TextStyle(color: Colors.brown[700]),
    ),
    onPressed: () {
    Navigator.pushNamed(context, '/login');
    /* Navigator.push(context, new MaterialPageRoute(
          builder: (context) => new Login()),);*/
    },
    ),
      Container(
        alignment: Alignment.center,
        child: Text(_success == null
            ? ''
            : (_success
            ? 'Successfully registered ' + _userEmail
            : 'Registration failed')),
      ),
    ],
    ),
    )));
  }

  final logo = Hero(
    tag: 'Myrah',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('assets/images/myrah_logo.png',width: 400.0,),
    ),
  );

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code for registration.
  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }
}
