import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/rendering.dart';

import '../scoped_models/users.dart';

class ProfilePage extends StatelessWidget {
  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: new IconButton(
        icon: new Image.asset('assets/LoginPage/Big-Logo.png'),
      ),
      title: Text(
        'Profile',
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

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBackGroundImage(),
        _buildUserImage(),
        SizedBox(
          height: height / 50,
        ),
        _buildUserCard(),
        SizedBox(
          height: height / 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildUpadate(),
            _buildChangePassword(),
          ],
        ),
      ],
    );
  }

  Widget _buildChangePassword() {
    return FlatButton(
      child: Text('Change Password'),
      textColor: Colors.white,
      onPressed: () {
        //Navigator.pushNamed(context, '/reset');
      },
    );
  }

  Widget _buildUpadate() {
    return Container(
        width: width / 2.5,
        child: RaisedButton(
            color: Color(0xFFAD045D),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(75.0)),
            textColor: Colors.white,
            child: Text('Update'),
            onPressed: () {}));
  }

  Widget _buildBackGroundImage() {
    return Container(
      width: width,
      alignment: Alignment.bottomLeft,
      height: height / 4,
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage('assets/ProfilePage/background-profile-img.jpg'),
            fit: BoxFit.fill),
      ),
      child: Container(),
    );
  }

  Widget _buildUserImage() {
    return Positioned(
        bottom: 300.0,
        left: 20.0,
        child: IconButton(
            iconSize: 200.0,
            icon: Image.asset('assets/ProfilePage/Profile-img.png')));
  }

  Widget _buildUserName() {
    print(userModel);
    return Row(
      children: <Widget>[
        Container(
          width: width / 2.8,
          child: Text(
            'Name:',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        SizedBox(
          width: width / 50,
        ),
        Text(
          userModel.AuthenticatedUser.userName,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ],
    );
  }

  Widget _buildUserMobile() {
    return Row(
      children: <Widget>[
        Container(
          width: width / 2.8,
          child: Text(
            'Mobile Number:',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        SizedBox(
          width: width / 50,
        ),
        (userModel.AuthenticatedUser.mobileNumber==null && userModel.AuthenticatedUser.mobileNumber.isEmpty)?Container(): Text(
          userModel.AuthenticatedUser.mobileNumber,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ],
    );
  }

  Widget _buildEmail() {
    return Row(
      children: <Widget>[
        Container(
          width: width / 2.8,
          child: Text(
            'Email:',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        SizedBox(
          width: width / 50,
        ),
        Text(
          userModel.AuthenticatedUser.email,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ],
    );
  }

  Widget _buildBirthDate() {
    return Row(
      children: <Widget>[
        Container(
          width: width / 2.8,
          child: Text(
            'Birth Data:',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        SizedBox(
          width: width / 50,
        ),
        Text(
          userModel.AuthenticatedUser.birthDate.day.toString() +
              '/' +
              userModel.AuthenticatedUser.birthDate.month.toString() +
              '/' +
              userModel.AuthenticatedUser.birthDate.year.toString(),
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ],
    );
  }

  Widget _buildAddress() {
    return Row(
      children: <Widget>[
        Container(
          width: width / 2.8,
          child: Text(
            'Address:',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        SizedBox(
          width: width / 50,
        ),
        Text(
          userModel.AuthenticatedUser.address,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ],
    );
  }

  Widget _buildCountry() {
    return Row(
      children: <Widget>[
        Container(
          width: width / 2.8,
          child: Text(
            'Country:',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        SizedBox(
          width: width / 50,
        ),
        Text(
          userModel.AuthenticatedUser.country,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ],
    );
  }

  Widget _buildCity() {
    return Row(
      children: <Widget>[
        Container(
          width: width / 2.8,
          child: Text(
            'City:',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        SizedBox(
          width: width / 50,
        ),
        Text(
          userModel.AuthenticatedUser.city,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ],
    );
  }

  Widget _buildUserCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromARGB(127, 127, 127, 127),
      ),
      height: height / 2.5,
      //margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildUserName(),
          _buildUserMobile(),
          _buildEmail(),
          _buildBirthDate(),
          _buildAddress(),
          _buildCountry(),
          _buildCity(),
        ],
      ),
    );
  }

  double width;
  double height;
  double devicePixelRatio;
  BuildContext formContext;
  UsersModel userModel;

  @override
  Widget build(BuildContext context) {
    formContext = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    // TODO: implement build
    return ScopedModelDescendant<UsersModel>(
        builder: (BuildContext context, Widget child, UsersModel model) {
      userModel = model;
      // model.getValues();
      return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context) 
        /*Stack(
          children: <Widget>[
            Positioned(
              top: 150.0, // (background container size) - (circle height / 2)
              left: 30.0,
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green
                ),
              ),
            )*/
           /* Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.9), BlendMode.dstATop),
                    image: AssetImage('assets/LoginPage/Background.jpg'),
                    fit: BoxFit.fill),
              ),
              child: _buildBody(context),

              //padding: EdgeInsets.all(10.0),
            ),*/
         // ],
      //  ),
      );
    });
  }
}
