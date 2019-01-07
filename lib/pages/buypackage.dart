import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import '../scoped_models/users.dart';

class BuyPackagePage extends StatefulWidget {
  final UsersModel user;

  BuyPackagePage(this.user);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BuyPackagePageState();
  }
}

class BuyPackagePageState extends State<BuyPackagePage> {
  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: new IconButton(
        icon: new Image.asset('assets/LoginPage/Big-Logo.png'),
      ),
      title: Text(
        'Buy Package',
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

  int _selectedPackage = -1;
  void _handlePackageSelect(int value) {
    setState(() {
      _selectedPackage = value;
    });
  }

  Widget _buildPackageA() {
    return Row(
      children: <Widget>[
        Radio(
          value: 0,
          onChanged: _handlePackageSelect,
          groupValue: _selectedPackage,
          activeColor: Colors.white,
        ),
        Text(
          'Package-A',
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ],
    );
  }

  Widget _buildPackageB() {
    return Row(children: <Widget>[
      Radio(
        value: 1,
        onChanged: _handlePackageSelect,
        groupValue: _selectedPackage,
        activeColor: Colors.white,
      ),
      Text('Package-B', style: TextStyle(color: Colors.white, fontSize: 15.0))
    ]);
  }

  Widget _buildPackageC() {
    return Row(children: <Widget>[
      Radio(
        value: 2,
        onChanged: _handlePackageSelect,
        activeColor: Colors.white,
        groupValue: _selectedPackage,
      ),
      Text('Package-C', style: TextStyle(color: Colors.white, fontSize: 15.0))
    ]);
  }

  String _selectPrePackage = '';
  Widget _buildPackageAWidget() {
     List<dynamic> prePack = new List<dynamic>();
    prePack = widget.user.PrePackages;
    if (prePack==null) {
      prePack = new List<dynamic>();
   
      prePack.add('no defined packages');
    }
    prePack.add('');
    List<DropdownMenuItem> items = new List<DropdownMenuItem>();
    for (var i = 0; i < prePack.length; i++) {
      items.add(new DropdownMenuItem(child:Text(prePack[i]["value"],),value:int.parse( prePack[i]["key"].toString()) ,));
    }
    return Container(
      height: height/5,
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Select Predefined Package',
              style: TextStyle(color: Colors.white, fontSize: 15.0)),
          DropdownButton<String>(
            value: _selectPrePackage,
            items:items
            ,
            onChanged: (String v) {
              setState(() {
                _selectPrePackage = v;
                print('PreDefined Package:' + _selectPrePackage.toString());
              });
            },
          )
        ],
      ),
    );
  }

  Widget _buildPackageBWidget() {
    return Text('Package-B');
  }

  Widget _buildPackageCWidget() {
    return Text('Package-B');
  }

  Widget _buildSelectedPackage() {
    Widget selectedPackageWidget;
    switch (_selectedPackage) {
      case 0: //Package-A
        selectedPackageWidget = _buildPackageAWidget();
        break;

      case 1: //Package-B
        selectedPackageWidget = _buildPackageBWidget();
        break;

      case 2: //Package-C
        selectedPackageWidget = _buildPackageCWidget();
        break;
    }
    return Container(
      width: width,
      height: height,
      child: selectedPackageWidget,
    );
  }

  List<Widget> _buildPackages() {
    List<Widget> items = new List<Widget>();
    Widget packageA = _buildPackageA();
    Widget packageB = _buildPackageB();
    Widget packageC = _buildPackageC();
    items.add(packageA);
    items.add(packageB);
    items.add(packageC);

    return items;
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Theme(
        data: ThemeData.dark(),
        child: ListView(
          children: <Widget>[
            Row(
              //padding: EdgeInsets.all(20.0),
              //scrollDirection: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              //primary: false,
              children: _buildPackages(),
            ),
            _buildSelectedPackage(),
          ],
        ),
      ),
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
        body: Container(
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
