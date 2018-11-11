import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import '../models/categoty.dart';

import '../scoped_models/users.dart';

class ProductPage extends StatelessWidget {
  double width;
  double height;
  double devicePixelRatio;
  BuildContext formContext;

  List<Brand> brands = [
    new Brand(brandImage: 'assets/HomePage/Pizza-Hut.png',brandDescription: '25% Refund',brandName: 'Pizza-Hut'),
    new Brand(brandImage: 'assets/HomePage/Chilis.png',brandDescription: '25% Refund',brandName: 'Chilis'),
    new Brand(brandImage: 'assets/HomePage/Starbucks.png',brandDescription: '25% Refund',brandName: 'Starbucks'),
    new Brand(brandImage: 'assets/HomePage/Pizza-Hut.png',brandDescription: '25% Refund',brandName: 'Pizza-Hut'),
    new Brand(brandImage: 'assets/HomePage/Chilis.png',brandDescription: '25% Refund',brandName: 'Chilis'),
    new Brand(brandImage: 'assets/HomePage/Starbucks.png',brandDescription: '25% Refund',brandName: 'Starbucks'),
    new Brand(brandImage: 'assets/HomePage/Pizza-Hut.png',brandDescription: '25% Refund',brandName: 'Pizza-Hut'),
    new Brand(brandImage: 'assets/HomePage/Chilis.png',brandDescription: '25% Refund',brandName: 'Chilis'),
    new Brand(brandImage: 'assets/HomePage/Starbucks.png',brandDescription: '25% Refund',brandName: 'Starbucks'),
    new Brand(brandImage: 'assets/HomePage/Pizza-Hut.png',brandDescription: '25% Refund',brandName: 'Pizza-Hut'),

  ];
  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: new IconButton(
        icon: new Image.asset('assets/LoginPage/Big-Logo.png'),
      ),
      title: Text(
        'Fasion',
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

  Widget _buildUserName() {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(127, 127, 127, 127)),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        height: 30.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.white,
              iconSize: 20.0,
              alignment: Alignment.topRight,
              onPressed: () {},
            ),
            Text(
              'User Name',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocation() {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(127, 127, 127, 127)),
      // margin: EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        height: 30.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/HomePage/Location-Icons.png'),
              iconSize: 30.0,
              alignment: Alignment.topRight,
              onPressed: () {},
            ),
            Text(
              'Location',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomMenu() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(icon: Image.asset('assets/HomePage/Home-Icons.png')),
          title: Text(
            'Home',
            style: TextStyle(color: Color(0xFFAD045D)),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              icon: Image.asset('assets/HomePage/Coupons-Icons.png')),
          title: Text(
            'Category',
            style: TextStyle(color: Color(0xFFAD045D)),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              icon: Image.asset('assets/HomePage/Platinum-Icons.png')),
          title: Text(
            'Platinum',
            style: TextStyle(color: Color(0xFFAD045D)),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon: Image.asset('assets/HomePage/More-Icons.png')),
          title: Text(
            'More',
            style: TextStyle(color: Color(0xFFAD045D)),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterationButtons() {
    return Container(
      height: 80.0 / devicePixelRatio,
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: width / 7,
            child: RaisedButton(
              color: Color(0xFFAD045D),
              textColor: Colors.white,
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('All',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 9.0))),
              onPressed: () {
                print('object');
              },
            ),
          ),
          Container(
            width: width / 3.5,
            child: RaisedButton(
              color: Colors.white,//Color(0xFFAD045D),
              textColor: Color(0xFFAD045D),//Colors.white,
              child: const Text(
                'Discounted Merchant',
                textAlign: TextAlign.start,
                
                style: TextStyle(fontSize: 10.0, inherit: false,color: Color(0xFFAD045D)),
              ),
              onPressed: () {
                print('object');
              },
            ),
          ),
          Container(
            width: width / 3.5,
            child: RaisedButton(
              color: Colors.white,//Color(0xFFAD045D),
              textColor: Colors.white,
              child: Text(
                'Refund Merchant',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 9.0,color: Color(0xFFAD045D)),
              ),
              onPressed: () {
                print('object');
              },
            ),
          ),
          Container(
            width: width / 5,
            child: RaisedButton(
              color: Colors.white,//Color(0xFFAD045D),
              textColor: Colors.white,
              child: Text(
                'My Favorite',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 9.0,color: Color(0xFFAD045D)),
              ),
              onPressed: () {
                print('object');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortButton(String text,bool isSelected) {
    return RaisedButton(
        color: !isSelected? Colors.white: Color(0xFFAD045D),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(75.0)),
        textColor: !isSelected?Color(0xFFAD045D): Colors.white,
        child: Text(text),
        onPressed: () {});
  }

  Widget _buildSortingButtons() {
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      //ListView(
      //  scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: width / 3,
            child: _buildSortButton('Popularity',false),
          ),
          Container(
            width: width / 4,
            child: _buildSortButton('A-Z',false),
          ),
          Container(
            width: width / 3,
            child: _buildSortButton('Near Me - 5K',true),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildGridItems(){
    List<Widget> items =  new List<Widget>();
     Widget item;
    for (var i = 0; i < brands.length; i++) {
      item = GestureDetector( 
        onTap: (){
            Navigator.pushNamed(formContext, '/brand');
        },
        child:Column(
          children: <Widget>[
            Image.asset(brands[i].brandImage),
            Text(brands[i].brandName,style: TextStyle(color: Colors.white),),
            Text(brands[i].brandDescription,style: TextStyle(color: Colors.white),),
          ],
        ),);
        items.add(item);
    }
    return items;
  }
  Widget _buildBrands(){
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: _buildGridItems(),
    );
  }
  Widget _buildCategory() {
    return   Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromARGB(127, 127, 127, 127),
      ),
      height: height / 2.0,
      margin: EdgeInsets.all(10.0),
      child: _buildBrands(),
    );
  }
  Widget _buildDivider(){
    return Divider(color: Color(0xFFFDB813),height: 15.0,);
  }
  Widget _buildBody() {
    return Container(
      width: width,
      height: height,
      child: ListView(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildUserName(),
          _buildLocation(),
          _buildFilterationButtons(),
          _buildDivider(),
          _buildSortingButtons(),
          //_buildSortButton('text'),
          _buildCategory(),
          //Container(alignment: Alignment.topLeft,width: 50.0, child:FlatButton( child:Text('All AllAllAllAllAll',textAlign: TextAlign.left,),onPressed: (){print('object');}),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    formContext = context;
    // TODO: implement build
    return ScopedModelDescendant<UsersModel>(
      builder: (BuildContext context, Widget child, UsersModel model) {
        // model.getValues();
        return Scaffold(
          appBar: _buildAppBar(),
          bottomNavigationBar: _buildBottomMenu(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
                  image: AssetImage('assets/LoginPage/Background.jpg'),
                  fit: BoxFit.fill),
            ),
            child: _buildBody(),
          ),
        );
      },
    );
  }
}
