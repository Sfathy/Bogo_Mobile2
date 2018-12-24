import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import '../models/categoty.dart';
import 'dart:async';
import '../scoped_models/users.dart';

class HomePage extends StatefulWidget {
  UsersModel user;
  HomePage(this.user);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Category> _catlist = new List<Category>();
  @override
  void initState() {
    // initializeCat();
    getData();
    //_catlist = _categotyList;
    super.initState();
  }

  List data;
  ScrollController _buttonScrollercnt = new ScrollController();
  double _currButtonInd = 0.0;
  Future<String> getData() async {
    List<Category> _catlst;
    List dt = await widget.user.getCategoryList();
    //var response = await http.get('http://192.168.8.101:52994/api/category/get');
    setState(() {
      _catlist = dt;
      /*data = dt; //json.decode(response.body);
      if (data != null) {
        _catlst = new List<Category>();
        List<Brand> brands = new List<Brand>();
        Brand b;
        Category c;
        for (var i = 0; i < data.length; i++) {
          brands = new List<Brand>();
          List bs = data[i]['brandsVM'];
          if (bs != null) {
            for (var j = 0; j < bs.length; j++) {
              b = new Brand(
                  id:  bs[j]['id'],
                  brandName: bs[j]['name'] != null ? bs[j]['name'] : '',
                  brandDescription: bs[j]['brandDescription'] != null ? bs[j]['brandDescription'] : '',
                  brandImage: bs[j]['logoImage'] != null ? bs[j]['logoImage'] : '',);
              brands.add(b);
            }
          }
          c = new Category(
              id: data[i]['id'],
              categoryName: (data[i]['name'] != null) ? data[i]['name'] : '',
              icon: data[i]['iconImage'] != null ? data[i]['iconImage'] : '',
              brands: brands);
          _catlst.add(c);
        }
        _catlist = _catlst;
      }*/
    });

    return "success";
  }

  BuildContext formContext;
  double width;
  double height;
  double devicePixelRatio;
  int selectedCat = 0;
  int _selectedTabIndex = 0;

  /* void initializeCat() async {
    //List<Map>
    List<Category> _catlst = new List<Category>();
    List responseData = await widget.user.getCategoryList();
    //print(responseData);
    if (responseData != null) {
      _catlst = new List<Category>();
      List<Brand> brands = new List<Brand>();
      Brand b;
      Category c;
      for (var i = 0; i < responseData.length; i++) {
        brands = new List<Brand>();
        List bs = responseData[i]['brandsVM'];
        for (var j = 0; j < bs.length; i++) {
          b = new Brand(
              id: 0,
              brandName: bs[j]['name'],
              brandDescription: '',
              brandImage: '');
          brands.add(b);
        }
        c = new Category(
            id: 0,
            categoryName: responseData[i]['name'],
            icon: responseData[i]['iconImage'],
            brands: brands);
        _catlst.add(c);
      }
      setState(() {
        _catlist = _catlst;
      });
      /*responseData.forEach(( dynamic data) {
        Map<String, dynamic> brandsData = data['brandsVM'];
        brands = new List<Brand>();
        brandsData.forEach((String id, dynamic db) {
          b = new Brand(
              id: db['id'],
              brandName: db['Name'],
              brandDescription: db['Address'],
              brandImage: db['LogoImage']);
          brands.add(b);
        });
        c = new Category(
            id: data['id'],
            categoryName: data['name'],
            icon: data['IconImage'],
            brands: brands);
        _catlist.add(c);
      });*/
    }
  }
*/
  List<Category> _categotyList = [
    new Category(
        categoryName: 'Resturants & Cafes',
        id: 0,
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
          new Brand(
              id: 3,
              brandName: 'Pizza Hut',
              brandDescription: '25% Refund',
              brandImage: 'assets/HomePage/Pizza-Hut.png'),
          new Brand(
              id: 4,
              brandName: 'Chili\'s',
              brandDescription: '20% Refund',
              brandImage: 'assets/HomePage/Chilis.png'),
          new Brand(
              id: 5,
              brandName: 'Starbucks',
              brandDescription: '15% Refund',
              brandImage: 'assets/HomePage/Starbucks.png'),
        ]),
    new Category(
        categoryName: 'Fashon',
        id: 1,
        icon: 'assets/HomePage/Specilas-Icons.png',
        brands: [
          new Brand(
              id: 0,
              brandName: 'Chili\'s',
              brandDescription: '20% Refund',
              brandImage: 'assets/HomePage/Chilis.png'),
          new Brand(
              id: 1,
              brandName: 'Pizza Hut',
              brandDescription: '25% Refund',
              brandImage: 'assets/HomePage/Pizza-Hut.png'),
        ])
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
        child: new GestureDetector(
          onTap: () {
            Navigator.pushNamed(formContext, '/profile');
          },
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
              (user.AuthenticatedUser != null &&
                      user.AuthenticatedUser.firstName != null &&
                      user.AuthenticatedUser.lastName != null)
                  ? Text(
                      user.AuthenticatedUser.firstName +
                          ' ' +
                          user.AuthenticatedUser.lastName,
                      style: TextStyle(color: Colors.white))
                  : Text('user Name', style: TextStyle(color: Colors.white))
            ],
          ),
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
      //width:width/2 ,
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
    return ListView(
      //mainxAxisAlignment: MainAxisAlignment.center,
      scrollDirection: Axis.horizontal,
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

      //_buildMoreButton(),
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
          Navigator.pushNamed(
              formContext, '/product/' + selectedCat.toString());
        },
      ),
    );
  }

  Widget _buildCatItem(BuildContext context, int index) {
    return Column(
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
        ListView.builder(
          itemCount: _categotyList[0].brands.length,
          itemBuilder: (BuildContext context, int brandIndex) {},
        ),
        //   _buildBrandList(index),
        _buildMoreButton(),
      ],
    );
    // _buildBrandList(index),
    //_buildMoreButton(),
  }

  Widget _buildCatItem2(BuildContext context, int index) {
    return ListView.builder(
        itemCount: _categotyList[0].brands.length,
        itemBuilder: (BuildContext context, int brandIndex) {
          return Container();
        });
  }

  Widget _buildCategoryContet() {
    return ListView.builder(
        itemCount: _categotyList.length, itemBuilder: _buildCatItem2);

    /*Container(
      constraints: BoxConstraints(minWidth: width, minHeight: height / 4),
      child: ListView.builder(
        itemCount: _categotyList.length,
        itemBuilder: Container(),
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
      ),
      Container(),
    );*/
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
      //primary: ,
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

  Widget _buildCatItemList(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: (_catlist == null || _catlist.length == 0)
          ? Container()
          : RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                //_catlist[index].categoryName,
                _catlist[index].categoryName,
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFFAD045D),
              onPressed: () {
                setState(() {
                  selectedCat = index;
                  Navigator.pushNamed(
                      formContext, '/product/' + selectedCat.toString());
                  // print('index:' + index.toString());
                  //print('selected cat:' + selectedCat.toString());
                });
              },
            ),
    );
  }

  Widget _buildCatButtons() {
    return Container(
      width: width - width / 6,
      child: (_catlist == null || _catlist.length == 0)
          ? Container()
          : ListView.builder(
              //shrinkWrap: true,
              //reverse: true,
              controller: _buttonScrollercnt,
              scrollDirection: Axis.horizontal,
              // itemExtent: 100.0,
              itemBuilder: _buildCatItemList,
              //itemCount: _catlist.length,
              itemCount: _catlist.length,
            ),
    );
  }

  Widget _buildHomeBody() {
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
              GestureDetector(
                child: Image.asset('assets/HomePage/previous-icons.png'),
                onTap: () {
                  //print('previous page');
                  setState(() {
                    _currButtonInd -= 100;
                    _buttonScrollercnt.animateTo(_currButtonInd,
                        duration: new Duration(seconds: 1), curve: Curves.ease);
                  });
                },
              ),

              _buildCatButtons(),
              GestureDetector(
                child: Image.asset('assets/HomePage/next-icons.png'),
                onTap: () {
                  setState(() {
                    _currButtonInd += 100;
                    //print('next page');
                    _buttonScrollercnt.animateTo(_currButtonInd,
                        duration: new Duration(seconds: 1), curve: Curves.ease);
                  });
                },
              ),
              //Image.asset('assets/HomePage/next-icons.png'),
            ],
          ),
        ),
        _buildCategotyCards(),
        // Container(),
      ],
    );
  }

  Widget _buildCategotyCards() {
    List<Widget> catCards = new List<Widget>();
    for (var i = 0; i < _catlist.length; i++) {
      selectedCat = i;
      catCards.add(_buildCategotyCard2());
    }
    return ListView(shrinkWrap: true, children: catCards);
    //return _buildCategotyCard2();
  }

  Widget _buildBrandItem(int index) {
    if (_catlist[selectedCat].brands[index].brandImage != null) {
      // print(user.ImagePath + _catlist[selectedCat].brands[index].brandImage);
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: <Widget>[
          _catlist[selectedCat].brands[index].brandImage == null
              ? Image.asset(user.DefaultImage,
                  height: height / 6, width: width / 4.1)
              : Image.network(
                  user.ImagePath +
                      _catlist[selectedCat].brands[index].brandImage,
                  height: height / 6,
                  width: width / 4.1),
          //height: height / 6, width: width / 4.1),
          Text(
            _catlist[selectedCat].brands[index].brandName,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            _catlist[selectedCat].brands[index].brandDescription,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftArrow() {
    return Image.asset(
      'assets/HomePage/previous-icons-inner.png',
      height: 30.0,
      width: 30.0,
    );
  }

  Widget _buildRightArrow() {
    return Image.asset(
      'assets/HomePage/next-icons-inner.png',
      height: 30.0,
      width: 30.0,
    );
  }

  List<Widget> _buildCatItems() {
    List<Widget> items = new List<Widget>();
    items.add(_buildLeftArrow());
    items.add(Center(
      child: Container(
        width: width / 1.3,
        child: ListView.builder(
          itemCount: _catlist[selectedCat].brands.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _buildBrandItem(index);
          },
        ),
      ),
    ));
    items.add(_buildRightArrow());

    return items;
  }

  Widget _buildCategotyCard2() {
    return (_catlist == null || _catlist.length <= 0)
        ? Container()
        : Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromARGB(127, 127, 127, 127),
                ),
                height: height / 2.7,
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: (_catlist == null ||
                                  _catlist.length == 0 ||
                                  _catlist[selectedCat].icon == '')
                              ? Image.asset(_categotyList[selectedCat].icon)
                              : Image.network(
                                  user.ImagePath + _catlist[selectedCat].icon),
                        ),
                        Text(
                          _catlist[selectedCat].categoryName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    // Row(children: <Widget>[
                    //TextField(),
                    Container(
                      // width: width/2,
                      child: Expanded(
                        flex: 1,
                        child: Center(
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              //width: width/1.5,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _buildCatItems()
                              /*<Widget>[
                        _buildLeftArrow(),
                        Center(
                          child: Container(
                            width: width / 1.3,
                            child: ListView.builder(
                              itemCount: _catlist[selectedCat].brands.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return _buildBrandItem(index);
                              },
                            ),
                          ),
                        ),
                        _buildRightArrow(),
                      ],*/
                              ),
                        ),
                      ),
                    ), //],),
                    _buildMoreButton(),
                  ],
                ),
              )
            ],
          );
    /*Coainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(127, 127, 127, 127),
              ),
              height: height / 2.7,
              margin: EdgeInsets.all(10.0),
              child: Column(
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
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categotyList[0].brands.length,
                        shrinkWrap: true,
                        itemBuilder: (formContext, index) {
                          return Text(
                              _categotyList[0].brands[index].brandDescription);
                        },
                      ),
                    ],
                  ),
                ],
              ));
        });*/
  }

 void _onItemTapped(int index) {
   setState(() {
     _selectedTabIndex = index;
   });
 }
  Widget _buildBottomMenu() {
    return BottomNavigationBar(
      currentIndex: _selectedTabIndex,
      onTap: _onItemTapped,
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
  Widget _buildCouponCard(int index) {
    if (user == null || user.CouponList == null || user.CouponList.length == 0) {
      return Container();
    }
    Coupon c = user.CouponList[index];
    return Container(
      width: width / 5,
      height: height,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      //alignment: Alignment.center,
      child: ListView(
        children: <Widget>[
          c.icon == null
              ? Image.asset(
                  c.icon,
                  width: 35.0,
                  height: 35.0,
                )
              : Image.network(
                  widget.user.ImagePath + c.icon,
                  width: 35.0,
                  height: 35.0,
                ),
          Center(
            child: Text(
              c.validTillAR,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 9.0,
              ),
            ),
          ),
          Center(
            child: Text(
              c.validTillEN,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                  fontSize: 9.0),
            ),
          ),
          c.image == null
              ? Image.asset(c.image)
              : Image.network(widget.user.ImagePath + c.image),
          Center(
            child: Text(
              c.descriptionAR,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.0),
            ),
          ),
          Center(
            child: Text(
              c.descriptionEN,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.0),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCouponItems() {
    List<Widget> coupons = new List<Widget>();

    Widget coupon = Container();
    if (user == null || user.CouponList == null || user.CouponList.length == 0) {
      coupons.add(coupon);
      return coupons;
    }
    for (var i = 0; i < user.CouponList.length; i++) {
      coupon = _buildCouponCard(i);
      coupons.add(coupon);
    }
    return coupons;
  }

  Widget _buildCoupons() {
    
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
      childAspectRatio: (width / 3) / (height / 3),
      children: _buildCouponItems(),
    );
  }
  Widget _buildCopounBody(){
    return _buildCoupons();
  }
  Widget _buildPlatinumBody(){
     return Center(child: Text('Platinum'),);
  }
  Widget _buildMoreBody(){
    return Center(child: Text('More'),);
  }
  Widget _buildBody(){
    switch (_selectedTabIndex) {
      case 0:
        return _buildHomeBody();
        break;
      case 1:
        return  _buildCopounBody();
          break;
      case 2:
        return _buildPlatinumBody();
        break;
      case 3:
        return _buildMoreBody();
        break;
      default:
        return Container();
    }
  }
  UsersModel user;
  @override
  Widget build(BuildContext context) {
    formContext = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    // _catlist = user.CatList;
    //     initializeCat();

    // TODO: implement build
    return ScopedModelDescendant<UsersModel>(
        builder: (BuildContext context, Widget child, UsersModel model) {
      user = model;

      // model.getValues();
      return Scaffold(
        appBar: _buildAppBar(),
        bottomNavigationBar: _buildBottomMenu(),
        body: //_buildCategotyCard2()
            Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9), BlendMode.dstATop),
                image: AssetImage('assets/LoginPage/Background.jpg'),
                fit: BoxFit.fill),
          ),
          child: _buildBody()// _buildCategotyCard2(), //_buildBody(),
        ),
      );
    });
    // });
  }
}
