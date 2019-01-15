import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import '../models/categoty.dart';

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

  double _price = 0.0;
  int _selectedPackage = -1;
  void _handlePackageSelect(int value) {
    setState(() {
      _selectedPackage = value;
      //if (value == 1) {}
    });
  }

  List<bool> _selectedOffers = new List<bool>();
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

  int _selectPrePackage = -1;
  List<Brand> offers = new List<Brand>();

  Widget _buildSelectedPreOffers() {
    //get selected package offers
    List<Widget> items = new List<Widget>();
    for (var i = 0; i < offers.length; i++) {
      //print('offer-' + i.toString() + ' ' + offers[i].descriptionEN);
      items.add(
        Column(
          children: <Widget>[
            Text(
              offers[i].brandName,
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            ),
            Image.network(
              widget.user.ImagePath + offers[i].brandImage,
              width: 50.0,
              height: 50.0,
            ),
            Text(
              offers[i].price.toString() + ' L.E.',
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            ),
          ],
        ),
      );
    }
    double itemWidth = width/4;
    double itemHeight = height/10;
    //display the offers in list view
    return Column(
      children: <Widget>[
        GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 3.0,
          
           shrinkWrap: true,
          childAspectRatio: (itemWidth / itemHeight),
          children: items,
        ),
      ],
    );
  }

  Widget _buildPackageAWidget() {
    List<PredefinedPackage> prePack = new List<PredefinedPackage>();
    prePack = widget.user.PrePackages;
    if (prePack == null) {
      prePack = new List<PredefinedPackage>();

      prePack.add(new PredefinedPackage(id:-1,name:'no predefined package',price: 0.0));
    }
    //prePack.add({'key': -2, 'value': ' '});
    //print('list:' + prePack.toString());
    List<DropdownMenuItem<int>> items = new List<DropdownMenuItem<int>>();
    for (var i = 0; i < prePack.length; i++) {
      items.add(new DropdownMenuItem(
        child: Text(
          prePack[i].name,
        ),
        value: prePack[i].id,
        
      ));
    }
    return Container(
      //height: height / 5,
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Select Predefined Package',
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
              DropdownButton<int>(
                value: _selectPrePackage < 0 ? null : _selectPrePackage,
                items: items,
                onChanged: (int v) {
                  setState(() {
                    _selectPrePackage = v;
                    PredefinedPackage d =(widget.user.PrePackages.singleWhere( (c) => c.id == v));
                    _price = d.price;
                    widget.user
                        .getPackageOffers(_selectPrePackage)
                        .then((onValue) {
                      offers = onValue;
                    });
                    //print('PreDefined Package:' + _selectPrePackage.toString());
                  });
                },
              ),
            ],
          ),
          _selectPrePackage >= 0
              ? Container(
                  child: _buildSelectedPreOffers(),
                  width: width - 20,
                  height: height / 3,
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildPackageBWidget() {
    List<Widget> items = new List<Widget>();
    //_selectedOffers = new List<bool>();
    List<Brand> offer = widget.user.Offers;
    if (offer == null ) {
     offer = new List<Brand>();
    }
    for (var i = 0; i < offer.length; i++) {
      if (_selectedOffers.length <= i) {
        _selectedOffers.add(false);
      }
      // print('offer-' + i.toString() + ' ' + offers[i].descriptionEN);
      items.add(Column(
        //primary: false,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: _selectedOffers[i],
            onChanged: (chk) {
              setState(() {
                _selectedOffers[i] = chk;
                chk ? _price += offer[i].price : _price -= offer[i].price;
              });
            },
          ),
        
            Text(
              offer[i].brandName,
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            ),
            Image.network(
              widget.user.ImagePath + offer[i].brandImage,
              width: 50.0,
              height: 50.0,
            ),
            Text(
              offer[i].price.toString() + ' L.E.',
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            ),
          
        ],
      ));
    }
    //display the offers in list view
    return 
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          children: items,
        
    );
  }

  Widget _buildPackageCWidget() {
    return Image.asset('assets/ProfilePage/background-profile-img.jpg');
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
      height: height/2,
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
             Text('Total Price: ' + _price.toString(),style: TextStyle(color: Colors.white,fontSize: 20.0),),
            RaisedButton(
                  color: Color(0xFFAD045D),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(75.0)),
                  textColor: Colors.white,
                  child: Text('Buy'),
                  onPressed: ()  {
                    print('package ' + _selectedPackage.toString()+' will be buyed');
                    // Navigator.pushReplacementNamed(context, '/home');
                  }),
            
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
