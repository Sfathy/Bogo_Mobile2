import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/users.dart';
import '../models/user.dart';

class RegPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegPageState();
  }
}

class RegPageState extends State<RegPage> {
  String _firstName;
  String _lastName;
  String _emailValue;
  String _password;
  String _mobile;
  String _gender;
  DateTime _birthdate;
  String _mac;
  String _location;
  String _address;
  String _country;
  String _city;
  UsersModel user;
  Widget _buildHeaderImage() {
    return Image.asset(
      'assets/RegistrationPage/main-img.jpg',
      alignment: Alignment.topCenter,
      fit: BoxFit.fill,
      height: height / 5,
      width: width,
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/LoginPage/google-plus.png',
          width: 50.0,
          height: 50.0,
        ),
        SizedBox(
          width: 25.0,
        ),
        Image.asset(
          'assets/LoginPage/facebook.png',
          width: 50.0,
          height: 50.0,
        ),
        SizedBox(
          width: 25.0,
        ),
        Image.asset(
          'assets/LoginPage/twitter.png',
          width: 50.0,
          height: 50.0,
        ),
      ],
    );
  }

  Widget _buildBodyBox() {
    return Expanded(
      child: Container(
        decoration: new BoxDecoration(
          color: Color.fromARGB(127, 127, 127, 127),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            _buildSocialIcons(),
            _buildFirstNameText(),
            _buildLastNameText(),
            _buildMobileText(),
            _buildEmailText(),
            _buildPasswordText(),
            _buildConfirmPasswordText(),
            _buildBirthDateText(),
            _buildAddressText(),
            _buildCountryText(),
            _buildCityText(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstNameText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'First Name',
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
      style: new TextStyle(color: Colors.white),// height: 0.1, fontSize: 0.1),
      onChanged: (String value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _buildLastNameText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Last Name',
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
      //obscureText: true,
      style: new TextStyle(color: Colors.white),// height: 0.1),
      onChanged: (String value) {
        setState(() {
          _lastName = value;
        });
      },
    );
  }

  Widget _buildMobileText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Mobile',
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
      //obscureText: true,
      style: new TextStyle(color: Colors.white),// height: 0.1),
      onChanged: (String value) {
        setState(() {
          _mobile = value;
        });
      },
    );
  }

  Widget _buildEmailText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
      //obscureText: true,
      style: new TextStyle(color: Colors.white),// height: 0.1),
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
      //obscureText: true,
      style: new TextStyle(color: Colors.white),// height: 0.1),
      onChanged: (String value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _buildConfirmPasswordText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
      
      //obscureText: true,
      style: new TextStyle(color: Colors.white),// height: 0.1),
    );
  }

  Widget _buildBirthDateText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Birth Date',
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
      //obscureText: true,
      style: new TextStyle(color: Colors.white),// height: 0.1),
      onChanged: (String value) {
        setState(() {
          _birthdate = DateTime.tryParse(value);
        });
      },
    );
  }

  Widget _buildAddressText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Address',
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
      // obscureText: true,
      style: new TextStyle(
        color: Colors.white,
        //height: 0.1,
      ),
      onChanged: (String value) {
        setState(() {
          _address = value;
        });
      },
    );
  }

  Widget _buildCountryText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Country',
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
      //obscureText: true,
      style: new TextStyle(color: Colors.white),// height: 0.1),
      onChanged: (String value) {
        setState(() {
          _country = value;
        });
      },
    );
  }

  Widget _buildCityText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'City',
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        fillColor: Colors.yellowAccent,
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.yellowAccent)),
      ),
     // obscureText: true,
      style: new TextStyle(color: Colors.white),// height: 0.1),
      onChanged: (String value) {
        setState(() {
          _city = value;
        });
      },
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: 400.0,
      child: RaisedButton(
        color: Color(0xFFAD045D),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(75.0)),
        textColor: Colors.white,
        child: Text('Sign Up'),
        onPressed: () async {
          final Map<String, dynamic> successInfo =
                        await user.signUp(new User(
              id: 0,
              userName: _emailValue,
              token: '',
              mobileNumber: _mobile,
              email: _emailValue,
              password: _password,
              address: _address,
              birthDate: _birthdate,
              city: _city,
              country: _country,
              firstName: _firstName,
              lastName: _lastName,
              gender: 0));
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }

  Widget _buildBody() {
    Widget image = _buildHeaderImage();
    Widget box = _buildBodyBox();
    Widget signUpButton = _buildSignUpButton();
    return Container(
      //padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
      // child: Text('test'),
      child: Column(
        children: <Widget>[
          image,
          //Text('data'),
          //  image,
          //  SizedBox(height:  20.0),
          box,
          signUpButton,
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: new IconButton(
        icon: new Image.asset('assets/LoginPage/Big-Logo.png'),
      ),
      title: Text(
        'Registeration',
        style: TextStyle(color: Color(0xFFAD045D)),
      ),
      actions: <Widget>[
        IconButton(
          alignment: Alignment.centerLeft,
          icon: new Image.asset('assets/HomePage/Search-Icons.png'),
        ),
        IconButton(
          icon: new Image.asset('assets/HomePage/Bell-Icons.png'),
        )
      ],
    );
  }

  double width;
  double height;
  double devicePixelRatio;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // TODO: implement build
    return ScopedModelDescendant<UsersModel>(
        builder: (BuildContext context, Widget child, UsersModel model) {
      user = model;
      // model.getValues();
      return Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9), BlendMode.dstATop),
                image: AssetImage('assets/LoginPage/Background.jpg'),
                fit: BoxFit.fill),
          ),
          child: _buildBody(),

          //padding: EdgeInsets.all(10.0),
        ),
      );
    });
  }
}
