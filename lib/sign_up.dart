import 'package:flutter/material.dart';
import 'login.dart';

class SignUp extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return new SignUpState();
  }

}

class SignUpState extends State<SignUp>
{
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  String _welcomeString = "";

  void _erase()
  {
    setState(() {
      _userController.clear();
      _passController.clear();
    });
  }

  void _showWelcome()
  {
    setState(() {
      if(_userController.text.isNotEmpty
          && _passController.text.isNotEmpty) {

        _welcomeString = _userController.text;
      }
      else
      {
        _welcomeString = "Nothing!";
      }
    });
  }

  final logo = Hero(
    tag: 'Myrah',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('assets/images/myrah_logo.png',width: 400.0,),
    ),
  );


  final user = TextFormField(
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
  );

  final email = TextFormField(
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
  ));

  final password = TextFormField(
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
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.white,
              ]
          )
        ),

        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            user,
            SizedBox(height: 8.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 18.0,),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
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
          ],
        ),
      ),
    );
  }

}