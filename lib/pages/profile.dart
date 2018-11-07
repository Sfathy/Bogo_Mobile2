import 'package:flutter/material.dart';

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
    return Center(
      child: Column(
        children: <Widget>[
          _buildBackGroundImage(),
          _buildUserImage(),
          _buildUserCard(),
        ],
      ),
    );
  }

  Widget _buildBackGroundImage(){
    return Container(
      width: width,
      height:  height/4,
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

  Widget _buildUserImage(){
    return Container();
  }

  Widget _buildUserCard(){
    return Container();
  }
  double width;
  double height;
  double devicePixelRatio;
  BuildContext formContext;


 @override
  Widget build(BuildContext context) {
   formContext = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
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
