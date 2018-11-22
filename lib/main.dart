import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


import './scoped_models/users.dart';
import './pages/auth.dart';
import './pages/register.dart';
import './pages/home.dart';
import './pages/rest_password.dart';
import './pages/product.dart';
import './pages/profile.dart';
import './pages/brand.dart';

import 'package:flutter/rendering.dart';

void main() {
  //debugPaintSizeEnabled = true;

  runApp(MyApp(model: UsersModel()));
  
}

class MyApp extends StatelessWidget {
  final UsersModel model;
  MyApp({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel(
      model: model,
      
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/reg':(BuildContext context) => RegPage(),
          '/home':(BuildContext context)=> HomePage(model), 
          '/reset':(BuildContext context)=> ResetPassword(),
          '/login':(BuildContext context)=> AuthPage(),
          '/product':(BuildContext context)=> ProductPage(),
          '/profile':(BuildContext context)=> ProfilePage(),
          '/brand':(BuildContext context)=> BrandPage(),
        },
        title: 'BOGO',

      ),
    );
  }
}
