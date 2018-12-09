import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../scoped_models/users.dart';
import 'dart:async';

class MyTestPage extends StatefulWidget {
  UsersModel user;
  MyTestPage(this.user);

  //final String title;

  @override
  createState() => new _MyTestPageState();
}

class _MyTestPageState extends State<MyTestPage>
    {
  

  List data;

  Future<String> getData() async{
    List dt = await widget.user.getCategoryList();
    //var response = await http.get('http://192.168.8.101:52994/api/category/get');
    setState(() {
          data = dt;//json.decode(response.body);      
        });
    
    return "success";

  }
  @override
  void initState() {
    getData();
    super.initState();
    
  }

  
  @override
  Widget build(BuildContext context) {
    
    //getData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Test Page'),
      ),
      body: data==null?Container(): ListView.builder(itemCount: data.length,itemBuilder: (BuildContext context,int index){
        return Text(index.toString() +' '+data[index]['name'].toString());
      },)
    );
  }
}

