import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import '../models/categoty.dart';

import '../scoped_models/users.dart';

class HomePage extends StatelessWidget {
  BuildContext formContext;
  double width;
  double height;
  double devicePixelRatio;
  final List<Category> _categotyList = [
    new Category(
        categoryName: 'Resturants & Cafes',
        id: 1,
        icon: 'assets/HomePage/Resturants-Icons.png',
        brands: [
          new Brand(
              id: 0,
              brandName: 'Pizza Hut',
              brandDescription: '25% Refund',
              brandImage: 'assets/HomePage/Pizza-Hut.png'),
          new Brand(
              id: 1,
              brandName: 'Chili\'s',
              brandDescription: '20% Refund',
              brandImage: 'assets/HomePage/Chilis.png'),
          new Brand(
              id: 2,
              brandName: 'Starbucks',
              brandDescription: '15% Refund',
              brandImage: 'assets/HomePage/Starbucks.png'),
        ]),
    new Category(
        categoryName: 'Specials',
        id: 2,
        icon: 'assets/HomePage/Specilas-Icons.png',
        brands: []),
  ];

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: new IconButton(
        icon: new Image.asset('assets/LoginPage/Big-Logo.png'),
      ),
      title: Text(
        '',
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

  Widget _buildBrandCard(BuildContext context, int index) {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              child: Column(
                children: <Widget>[
                  Image.asset(_categotyList[0].brands[index].brandImage,
                      height: height / 7, width: width / 7),
                  Text(
                    _categotyList[0].brands[index].brandName,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    _categotyList[0].brands[index].brandDescription,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
  }

  Widget _buildCategotyCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromARGB(127, 127, 127, 127),
      ),
      height: height / 2.7,
      margin: EdgeInsets.all(10.0),
      child: _buildCategoryContet(),
    );
  }

  Widget _buildBrandList(int index) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/HomePage/previous-icons-inner.png',
              height: 30.0,
              width: 30.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              child: ListView.builder(
                itemCount: _categotyList[index].brands.length,
                itemBuilder: _buildBrandCard,
              ),
            ),
             Image.asset(
              'assets/HomePage/next-icons-inner.png',
              height: 30.0,
              width: 30.0,
            ),
          ],
        ),
         _buildMoreButton(),
      ],
    );

   /* Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/HomePage/previous-icons-inner.png',
              height: 30.0,
              width: 30.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/HomePage/Pizza-Hut.png',
                      height: height / 7, width: width / 7),
                  Text(
                    'Pizza Hut',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '25 % Refund',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/HomePage/Chilis.png',
                      height: height / 7, width: width / 7),
                  Text(
                    'Chili\'s',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '15 % Refund',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/HomePage/Starbucks.png',
                      height: height / 7, width: width / 7),
                  Text(
                    'Starbucks',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '20 % Refund',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/HomePage/next-icons-inner.png',
              height: 30.0,
              width: 30.0,
            ),
          ],
        ),
        _buildMoreButton(),
      ],
    );*/
  }

  Widget _buildMoreButton() {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.all(5.0),
      child: RaisedButton(
        color: Color(0xFFAD045D),
        textColor: Colors.white,
        child: Text('More'),
        onPressed: () {
          Navigator.pushNamed(formContext, '/product');
        },
      ),
    );
  }

  Widget _buildCatItem(BuildContext context, int index) {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Image.asset(_categotyList[0].icon),
            ),
            Text(
              _categotyList[0].categoryName,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        _buildBrandList(index),
        //_buildMoreButton(),
      ],
    );
  }

  Widget _buildCategoryContet() {
    return Container(
      constraints: BoxConstraints(minWidth: width, minHeight: height / 4),
      child: ListView.builder(
        itemCount: _categotyList.length,
        itemBuilder: _buildCatItem,
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  List<String> _advList = [
    'assets/HomePage/small-image.png',
    'assets/HomePage/big-image.png',
    'assets/HomePage/small-image.png',
    'assets/HomePage/big-image.png',
    'assets/HomePage/small-image.png',
  ];
  Widget _buildAdvPic() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _advList.length,
      // reverse: true,

      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            children: <Widget>[
              Image.asset(
                _advList[index],
                fit: BoxFit.contain,
                alignment: Alignment.center,
                //height: height/7,
                width: width / 3,
              ),
            ],
          ),
        );
      },
    );
  }

  List<String> _mainCatList = [
    'Fasion',
    'Health & Medical',
    'Sweets',
    'Fasion',
    'Health & Medical',
    'Sweets'
  ];
  Widget _buildCatItemList(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          _mainCatList[index],
          style: TextStyle(color: Colors.white),
        ),
        color: Color(0xFFAD045D),
        onPressed: () {},
      ),
    );
  }

  Widget _buildCatButtons() {
    return Container(
      width: width - width / 6,
      child: ListView.builder(
        //shrinkWrap: true,
        //reverse: true,
        scrollDirection: Axis.horizontal,
        // itemExtent: 100.0,
        itemBuilder: _buildCatItemList,
        itemCount: _mainCatList.length,
      ),
    );
  }

  Widget _buildBody() {
    return //Column(children:<Widget>[ _buildCatButtons()]);
        ListView(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildUserName(),
        _buildLocation(),
        Container(
          height: height / 7,
          alignment: Alignment.topLeft,
          child: _buildAdvPic(),
        ),
        Container(
          height: height / 20,
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Image.asset('assets/HomePage/previous-icons.png'),
              _buildCatButtons(),
              Image.asset('assets/HomePage/next-icons.png'),
            ],
          ),
        ),
        _buildCategotyCard(),
        // Container(),
      ],
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

  @override
  Widget build(BuildContext context) {
    formContext = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

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
          /*ListView(
             children: <Widget>[
               Text('1'),
               Text('2'),
               Text('3')
             ],
           )*/
          //padding: EdgeInsets.all(10.0),
        ),
      );
    });
  }
}
