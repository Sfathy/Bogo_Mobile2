import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/users.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;
  double width;
  double height;
  double devicePixelRatio;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop),
              image: AssetImage('assets/LoginPage/Background.jpg'),
              fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(height/10),
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/LoginPage/Big-Logo.png',
              width: width/3,
              height: height/4,
            ),
            SizedBox(height: height/25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/LoginPage/google-plus.png',
                  width: width/9,
                  height: height/10,
                ),
                SizedBox(
                  width: width/20,
                ),
                Image.asset(
                  'assets/LoginPage/facebook.png',
                  width: width/9,
                  height: height/10,
                ),
                SizedBox(
                  width: width/20,
                ),
                Image.asset(
                  'assets/LoginPage/twitter.png',
                  width: width/9,
                  height: height/10,
                ),
              ],
            ),
            SizedBox(
              height: height/25,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'User Name',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.lime)),
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white)),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(color: Colors.white),
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                fillColor: Colors.yellowAccent,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.pink,
                ),
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.yellowAccent)),
              ),
              obscureText: true,
              style: new TextStyle(color: Colors.white),
              onChanged: (String value) {
                setState(() {
                  _passwordValue = value;
                });
              },
            ),

            /*SwitchListTile(
              value: _acceptTerms,
              onChanged: (bool value) {
                setState(() {
                  _acceptTerms = value;
                });
              },
              title: Text('Accept Terms'),
            ),*/
            SizedBox(
              height: height/30,
            ),
            ScopedModelDescendant<UsersModel>(builder:
                (BuildContext context, Widget child, UsersModel model) {
              return RaisedButton(
                  color: Color(0xFFAD045D),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(75.0)),
                  textColor: Colors.white,
                  child: Text('Log In'),
                  onPressed: () async {
                    final Map<String, dynamic> successInfo =
                        await model.login(_emailValue, _passwordValue);
                    if (successInfo['success']) {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text('An Error Occurred!'),
                                content: Text(successInfo['message']),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ]);
                          });
                    }
                    // Navigator.pushReplacementNamed(context, '/home');
                  });
            }) ,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Register'),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/reg');
                      },
                    ),
                    FlatButton(
                      child: Text('Forget Password'),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/reset');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
