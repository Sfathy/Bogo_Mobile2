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
import './pages/test_page.dart';

import 'package:flutter/rendering.dart';

void main() {
  //debugPaintSizeEnabled = true;

  runApp(MyApp());
  
}

class MyApp extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState(){
      return _MyAppState();
  }
   MyApp({Key key}) : super(key: key);
}
class _MyAppState extends State<MyApp>{
   final UsersModel model = UsersModel() ;

   @override
   void initState(){
     model.AutoAuth();
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<UsersModel>(
      model: model,
      
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        routes: {
          '/': (BuildContext context) =>ScopedModelDescendant(builder: (BuildContext context,Widget child,UsersModel _model){
            return _model.AuthenticatedUser!=null?HomePage(model):AuthPage();
          },) ,
          '/reg':(BuildContext context) => RegPage(),
          '/home':(BuildContext context)=> HomePage(model), 
          '/reset':(BuildContext context)=> ResetPassword(),
          '/login':(BuildContext context)=> AuthPage(),
          '/product':(BuildContext context)=> ProductPage(),
          '/profile':(BuildContext context)=> ProfilePage(),
          '/brand':(BuildContext context)=> BrandPage(),
          '/test':(BuildContext context)=> MyTestPage(model),
        },
        title: 'BOGO',

      ),
    );
  }
}
