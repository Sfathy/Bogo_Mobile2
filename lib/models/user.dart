import 'package:flutter/material.dart';


class User{
  
  
  final String userName;
  final String mobileNumber = '0100xxxxxxx';
  final String email = 'user@bogo.com';
  final DateTime birthDate =  new DateTime(1981,1,26);
  final String address = 'address';
  final String country = 'Egypt';
  final String city ='cairo';
  
  final int id;
  final String token;


  User({@required this.userName,@required this.id,@required this.token});

}