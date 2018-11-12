import 'package:flutter/material.dart';

class BrandPage extends StatelessWidget {
  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: new IconButton(
        icon: new Image.asset('assets/LoginPage/Big-Logo.png'),
      ),
      title: Text(
        'Forget Password',
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
  TabController _controller;
  Widget _buildBody(BuildContext context) {
    return  TabBar(
            controller: _controller,
            tabs:<Widget>[
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
    );
  }

 Widget _buildSignUpButton(BuildContext context) {
    return SizedBox(
     width: 400.0,
     
      child: 
        RaisedButton(
          color: Color(0xFFAD045D),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(75.0)),
          textColor: Colors.white,
          child: Text('Send Email'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        child: _buildBody(context),

        //padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
