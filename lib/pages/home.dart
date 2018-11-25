import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import '../models/categoty.dart';

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
    super.initState();
  }

  List data;

  Future<String> getData() async {
    List<Category> _catlst;
    List dt = await widget.user.getCategoryList();
    //var response = await http.get('http://192.168.8.101:52994/api/category/get');
    setState(() {
      data = dt; //json.decode(response.body);
      if (data != null) {
        _catlst = new List<Category>();
        List<Brand> brands = new List<Brand>();
        Brand b;
        Category c;
        for (var i = 0; i < data.length; i++) {
          brands = new List<Brand>();
          List bs = data[i]['brandsVM'];
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
              categoryName: data[i]['name'],
              icon: data[i]['iconImage'],
              brands: brands);
          _catlst.add(c);
        }
      }
    });

    return "success";
  }

  BuildContext formContext;
  double width;
  double height;
  double devicePixelRatio;
  int selectedCat = 0;

  void initializeCat() async {
    //List<Map>
    List<Category> _catlst = new List<Category>();
    List responseData = await widget.user.getCategoryList();
    print(responseData);
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
          Navigator.pushNamed(formContext, '/product');
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
    if (data != null) {
      print(data[index]['name']);
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: (data == null || data.length == 0)
            ? Container()
            : Text(
                //_catlist[index].categoryName,
                data[index]['name'],
                style: TextStyle(color: Colors.white),
              ),
        color: Color(0xFFAD045D),
        onPressed: () {
          setState(() {
            selectedCat = index;
            print('index:' + index.toString());
            print('selected cat:' + selectedCat.toString());
          });
        },
      ),
    );
  }

  Widget _buildCatButtons() {
    return Container(
      width: width - width / 6,
      child: (data == null || data.length == 0)
          ? Container()
          : ListView.builder(
              //shrinkWrap: true,
              //reverse: true,
              scrollDirection: Axis.horizontal,
              // itemExtent: 100.0,
              itemBuilder: _buildCatItemList,
              //itemCount: _catlist.length,
              itemCount: data.length,
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
        _buildCategotyCard2(),
        // Container(),
      ],
    );
  }

  Widget _buildBrandItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: <Widget>[
          Image.asset(_categotyList[selectedCat].brands[index].brandImage,
              height: height / 6, width: width / 4.1),
          Text(
            _categotyList[selectedCat].brands[index].brandName,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            _categotyList[selectedCat].brands[index].brandDescription,
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

  Widget _buildCategotyCard2() {
    return Column(
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
                    icon: Image.asset(_categotyList[selectedCat].icon),
                  ),
                  Text(
                    _categotyList[selectedCat].categoryName,
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
                      children: <Widget>[
                        _buildLeftArrow(),
                        Center(
                          child: Container(
                            width: width / 1.3,
                            child: ListView.builder(
                              itemCount:
                                  _categotyList[selectedCat].brands.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return _buildBrandItem(index);
                              },
                            ),
                          ),
                        ),
                        _buildRightArrow(),
                      ],
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
          child: _buildBody(), // _buildCategotyCard2(), //_buildBody(),
        ),
      );
    });
    // });
  }
}
