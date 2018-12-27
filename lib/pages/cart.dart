import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/rendering.dart';

import '../scoped_models/users.dart';

class CartPage extends StatelessWidget {
  final UsersModel user;
  CartPage(this.user);
  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: new IconButton(
        icon: new Image.asset('assets/LoginPage/Big-Logo.png'),
      ),
      title: Text(
        'My Cart',
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

  List<Widget> _buildCartItems(){
    List<Widget> items = new List<Widget>();
    if (user != null) {
      List<String> cs = user.CartItems;
      for (var i = 0; i < cs.length; i++) {
        items.add(Text(cs[i],style: TextStyle(color: Colors.white),) );
        items.add(SizedBox(height: 10.0,));
      }
    }
    return items;
  }
  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      //primary: false,
      children: _buildCartItems()
    );
  }

 
  double width;
  double height;
  double devicePixelRatio;
  BuildContext formContext;
  //UsersModel userModel;

  @override
  Widget build(BuildContext context) {
    formContext = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    // TODO: implement build
    return ScopedModelDescendant<UsersModel>(
        builder: (BuildContext context, Widget child, UsersModel model) {
     // userModel = model;
      // model.getValues();
      return Scaffold(
        appBar: _buildAppBar(),
        body:  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      image: AssetImage('assets/LoginPage/Background.jpg'),
                      fit: BoxFit.fill),
                ),
                child: _buildBody(context) // _buildCategotyCard2(), //_buildBody(),
                ),

      );
    });
  }
}
