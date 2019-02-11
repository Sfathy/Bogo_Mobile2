import 'package:flutter/material.dart';

import '../models/categoty.dart';
import '../scoped_models/users.dart';

class CustomWidget extends StatefulWidget {
  final int index;
  final bool longPressEnabled;
  final VoidCallback callback;
  final bool isselected;
  final UsersModel user;
  final BrandDetails brand;

  const CustomWidget(
      {Key key,
      this.index,
      this.longPressEnabled,
      this.callback,
      this.isselected,
      this.brand,
      this.user})
      : super(key: key);

  @override
  _CustomWidgetState createState() => new _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Coupon c = widget.brand.coupons[widget.index];
    return new GestureDetector(
      onLongPress: () {
        if (c.isActive && !c.isUsed) {
          widget.callback();
        }
      },
      onTap: () {
        if (widget.longPressEnabled) {
          if (c.isActive && !c.isUsed) {
            widget.callback();
          }
        }
      },
      child: new Container(
        margin: new EdgeInsets.all(5.0),
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
                  fontSize: 5.0,
                ),
              ),
            ),
            Center(
              child: Text(
                c.validTillEN,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    fontSize: 5.0),
              ),
            ),
            c.image == null
                ? Image.asset(c.image)
                : Image.network(widget.user.ImagePath + c.image),
            Center(
              child: Text(
                c.descriptionAR,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 5.0),
              ),
            ),
            Center(
              child: Text(
                c.descriptionEN,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 5.0),
              ),
            ),
          ],
        ),
        decoration: c.isSelected
            ? new BoxDecoration(
                color: Colors.blue, border: new Border.all(color: Colors.black))
            : new BoxDecoration(),
      ),
    );
  }
}

class BrandPage extends StatefulWidget {
  final int brandID;
  final UsersModel user;
  BrandDetails brand;
  BrandPage(this.brandID, this.user);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BrandPageState();
  }
}

class BrandPageState extends State<BrandPage> {
  bool longPressFlag = false;
  void initData() async {
    BrandDetails b = await widget.user.getBrandDetails(widget.brandID);
    setState(() {
      brand = b;
      widget.brand = b;
    });
  }

  onCoupon_selected(int index) {
    setState(() {
      brand.coupons[index].isSelected = !brand.coupons[index].isSelected;
      //indexList[index].isselected=!indexList[index].isselected;
    });
  }

  onPlatinum_selected(int index) {
    setState(() {
      brand.platinums[index].isSelected = !brand.platinums[index].isSelected;
      //indexList[index].isselected=!indexList[index].isselected;
    });
  }

  void longPressCoupon() {
    setState(() {
      if (brand.coupons.isEmpty) {
        longPressFlag = false;
      } else {
        longPressFlag = true;
      }
    });
  }

  void longPressPlat() {
    setState(() {
      if (brand.platinums.isEmpty) {
        longPressFlag = false;
      } else {
        longPressFlag = true;
      }
    });
  }

  void initState() {
    initData();

    super.initState();
  }

  BuildContext formContext;
  double width;
  double height;
  double devicePixelRatio;

  BrandDetails brand;
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

  Widget _buildGenButton() {
    return Positioned(
      bottom: 5.0,
      right: 10.0,
      child: FloatingActionButton(
        child: Icon(Icons.data_usage),
        onPressed: () async {
          final Map<String, dynamic> successInfo =
              await widget.user.generateCode(brand.coupons, brand.platinums);
          if (successInfo['success']) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      //title: Text('An Error Occurred!'),
                      content: Text(successInfo['message']),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ]);
                });
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Text('An Error Occurred!'),
                      content: Text(
                          'Error while generating the code,please try again later'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ]);
                });
          }
        },
      ),
    );
  }

  TabController _controller;
  Widget _buildBody(BuildContext context) {
    if (brand == null) {
      //print('brand ID ' + widget.brandID.toString() + '= null');
    }
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            _buildUserName(),
            _buildLocation(),
            brand == null ? Container() : _buildBrandImage(),
            SizedBox(
              height: height / 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                brand == null ? Container() : _buildBrandLogo(),
                brand == null ? Container() : _buildBrandText(),
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
            _buildTabs(),
          ],
        ),
        _buildGenButton(),
      ],
    );
  }

  Widget _buildBrandText() {
    return Container(
      padding: EdgeInsets.all(5.0),
      //margin: EdgeInsets.only(top: -10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            brand.brandName,
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                'assets/Branches/face-icon-for-branches.png',
                width: 20.0,
                height: 20.0,
              ),
              brand.brandFaceLink != null && brand.brandFaceLink != ''
                  ? Image.asset(
                      'assets/Branches/telegram-icon-for-branches.png',
                      width: 20.0,
                      height: 20.0)
                  : Container(),
              brand.brandTwttierLink != null && brand.brandTwttierLink != ''
                  ? Image.asset('assets/Branches/twttier-icon-for-branches.png',
                      width: 20.0, height: 20.0)
                  : Container(),
              Text(
                brand.brandDescription,
                style: TextStyle(color: Colors.white, fontSize: 10.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBrandImage() {
    return brand == null || brand.brandImage == null
        ? Image.asset(
            'assets/Branches/img-product.jpg',
            width: width,
            height: height / 4,
            fit: BoxFit.fill,
          )
        : Image.network(
            widget.user.ImagePath + brand.brandImage,
            width: width,
            height: height / 4,
            fit: BoxFit.fill,
          );
  }

  Widget _buildBrandLogo() {
    return brand == null || brand.brandIcon == null
        ? Image.asset(
            'assets/HomePage/Starbucks.png',
            fit: BoxFit.fill,
            width: width / 5,
            height: height / 11,
            alignment: Alignment.topLeft,
          )
        : Image.network(
            widget.user.ImagePath + brand.brandIcon,
            fit: BoxFit.fill,
            width: width / 5,
            height: height / 11,
            alignment: Alignment.topLeft,
          );
  }

  Widget _buildSortButton() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 20.0),
      // width: 150.0,
      child: RaisedButton(
        color: Color(0xFFAD045D),
        textColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(75.0)),
        child: Text('A-Z'),
        onPressed: () {},
      ),
    );
  }

  Widget _buildBranchCard(BuildContext build, int index) {
    if (brand == null) return Container();
    Branch b = brand.branches[index];
    return Container(
      decoration: BoxDecoration(
        border: new Border(
            top: BorderSide(width: 2.0, color: Color(0xFFFDB813)),
            bottom: BorderSide(width: 2.0, color: Color(0xFFFDB813))),
        //borderRadius: BorderRadius.circular(20.0),
        color: Colors.white54,
      ),
      width: width,
      height: height / 7,
      margin: EdgeInsets.symmetric(vertical: 2.0),
      padding: EdgeInsets.all(2.0),
      child: ListView(

        //primary: false,
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.start,
        scrollDirection: Axis.horizontal,
        primary: false,
        children: <Widget>[
          Container(
            width: width / 1.4,
            child: ListView(
              //Expanded(child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,

              //shrinkWrap: true,
              children: <Widget>[
                Text(
                  brand.branches[index].branchName,
                  style: TextStyle(color: Color(0xFFAD045D), fontSize: 15.0),
                ),
                Text(
                  brand.branches[index].branchAddress,
                  style: TextStyle(color: Color(0xFFAD045D), fontSize: 10.0),
                ),
                //Expanded(
                //child:
                Row(
                  
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  children: _buildFeatureImages(index),
                ), //)
              ],
            ), //),
          ),
         /* SizedBox(
            width: width / 5,
          ),*/
          Container(
            width: width / 4,
            height: height / 7,
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                brand.branches[index].branchTelephone == null ||
                        brand.branches[index].branchTelephone == ''
                    ? Container()
                    : Image.asset(
                        'assets/Branches/phone.png',
                        width: 35.0,
                        height: 35.0,
                      ),
                brand.branches[index].branchLocation == null ||
                        brand.branches[index].branchLocation == ''
                    ? Container()
                    : Image.asset(
                        'assets/Branches/erea.png',
                        width: 35.0,
                        height: 35.0,
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildFeatureImages(int branchIndex) {
    List<Widget> features = new List<Widget>();
    if (brand == null || brand.branches == null || brand.branches.length == 0) {
      features.add(Container());
      return features;
    }
     print('BrandID:' + brand.id.toString()); 
     print('featur:' + brand.branches[branchIndex].availableFeatures.length.toString());
    for (var i = 0;
        i < brand.branches[branchIndex].availableFeatures.length;
        i++) {
         
      features.add(brand.branches[branchIndex].availableFeatures[i] != null &&
              brand.branches[branchIndex].availableFeatures[i] != '' &&
              brand.branches[branchIndex].availableFeatures[i] != 'null' 
          ? Image.asset(
              'assets/Branches/' +
                  brand.branches[branchIndex].availableFeatures[i],
              width: 35.0,
              height: 35.0,
            )
          : Image.asset(
              'assets/Branches/erea.png' ,
              width: 35.0,
              height: 35.0,
            ));
    }
    return features;
  }

  Widget _buildBraches() {
    if (brand == null || brand.branches == null || brand.branches.length == 0) {
      return Container();
    }
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildSortButton(),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: _buildBranchCard,
          itemCount: brand.branches.length,
        ),
      ],
    );
  }

  Widget _buildCouponCard(int index) {
    if (brand == null || brand.coupons == null || brand.coupons.length == 0) {
      return Container();
    }
    Coupon c = brand.coupons[index];
    return Container(
        width: width / 5,
        height: height,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        //alignment: Alignment.center,
        child: CustomWidget(
          index: index,
          isselected: brand.coupons[index].isSelected,
          brand: brand,
          user: widget.user,
          longPressEnabled: longPressFlag,
          callback: () {
            onCoupon_selected(index);
            /*if (indexList.contains(index)) {
                indexList.remove(index);
              } else {
                indexList.add(Element());
              }*/

            longPressCoupon();
          },
        ));
  }

  List<Widget> _buildCouponItems() {
    List<Widget> coupons = new List<Widget>();

    Widget coupon = Container();
    if (brand == null || brand.coupons == null || brand.coupons.length == 0) {
      coupons.add(coupon);
      return coupons;
    }
    for (var i = 0; i < brand.coupons.length; i++) {
      coupon = _buildCouponCard(i);
      coupons.add(coupon);
    }
    return coupons;
  }

  Widget _buildCoupons() {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: (width / 4) / (height / 4),
      children: _buildCouponItems(),
    );
  }

  Widget _buildPlatinumCard(int index) {
    if (brand == null ||
        brand.platinums == null ||
        brand.platinums.length == 0) {
      return Container();
    }
    Platinum c = brand.platinums[index];
    return Container(
        width: width / 5,
        height: height,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.grey,
        ),
        //alignment: Alignment.center,
        child: CustomPlatWidget(
          index: index,
          isselected: brand.platinums[index].isSelected,
          brand: brand,
          user: widget.user,
          longPressEnabled: longPressFlag,
          callback: () {
            onPlatinum_selected(index);
            /*if (indexList.contains(index)) {
                indexList.remove(index);
              } else {
                indexList.add(Element());
              }*/

            longPressPlat();
          },
        ));
  }

  List<Widget> _buildPlatinumItems() {
    List<Widget> platinums = new List<Widget>();

    Widget platinum = Container();
    if (brand == null ||
        brand.platinums == null ||
        brand.platinums.length == 0) {
      platinums.add(platinum);
      return platinums;
    }
    for (var i = 0; i < brand.platinums.length; i++) {
      platinum = _buildPlatinumCard(i);
      platinums.add(platinum);
    }
    return platinums;
  }

  Widget _buildPlatinum() {
    return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        padding: EdgeInsets.all(5.0),
        childAspectRatio: (width / 2) / (height / 4),
        children: _buildPlatinumItems());
  }

  //TabController _controller;
  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        /*image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage('assets/Branches/background-3-tabs.png'),
            
            fit: BoxFit.fill),*/
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Text('data'),
          TabBar(
            indicatorColor: Color(0xFFAD045D),
            //indicatorSize: TabBarIndicatorSize.label,
            labelColor: Color(0xFFAD045D),
            //labelPadding: EdgeInsets.all(10.0),
            // indicatorPadding: EdgeInsets.all(20.0),
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                //icon: Icon(Icons.directions_car),
                text: 'Branches',
              ),
              Tab(
                //icon: Icon(Icons.directions_transit),
                text: 'Coupons',
              ),
              Tab(
                //icon: Icon(Icons.directions_bike),
                text: 'Platinum Ticket',
              ),
            ],
          ),
          Center(
            child: Container(
              width: width,
              height: height / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  //image: AssetImage('assetName'),
                  color: Color.fromARGB(150, 0, 0, 0)),
              child: TabBarView(

                children: [
                  _buildBraches(),
                  _buildCoupons(),
                  _buildPlatinum(),
                ],
              ),
            ),
          ),
        ],
      ),
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
              Text(
                'User Name',
                style: TextStyle(color: Colors.white),
              ),
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

  @override
  Widget build(BuildContext context) {
    formContext = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9), BlendMode.dstATop),
                image: AssetImage('assets/LoginPage/Background.jpg'),
                fit: BoxFit.fill),
          ),
          child: _buildBody(context),

          //padding: EdgeInsets.all(10.0),
          //),
        ),
      ),
    );
  }
}

class CustomPlatWidget extends StatefulWidget {
  final int index;
  final bool longPressEnabled;
  final VoidCallback callback;
  final bool isselected;
  final UsersModel user;
  final BrandDetails brand;

  const CustomPlatWidget(
      {Key key,
      this.index,
      this.longPressEnabled,
      this.callback,
      this.isselected,
      this.brand,
      this.user})
      : super(key: key);

  @override
  _CustomPlatWidgetState createState() => new _CustomPlatWidgetState();
}

class _CustomPlatWidgetState extends State<CustomPlatWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Platinum c = widget.brand.platinums[widget.index];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new GestureDetector(
      onLongPress: () {
        if (c.isActive && !c.isUsed) {
          widget.callback();
        }
      },
      onTap: () {
        if (widget.longPressEnabled) {
          if (c.isActive && !c.isUsed) {
            widget.callback();
          }
        }
      },
      /*
       decoration: c.isSelected
            ? new BoxDecoration(
                color: Colors.black38,
                border: new Border.all(color: Colors.black))
            : new BoxDecoration(),
      */
      child: Container(
        width: width / 5,
        height: height,
        decoration: !c.isSelected
            ? new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.grey,
              )
            : new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.blue,
              ),
        //alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            c.isUsed
                ? Container(
                    child: Center(
                      child: Text(
                        'Used',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                : Container(),
            !c.isActive
                ? Container(
                    child: Center(
                      child: Text(
                        'Not Active',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    c.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Image.network(
                    widget.user.ImagePath + c.image,
                    width: 35.0,
                    height: 35.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                c.description,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10.0),
              ),
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/PlatinumTicket/facebook-icon-01.png',
                  width: 20.0,
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    c.faceBookLink,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/PlatinumTicket/whattsapp-icon-01.png',
                  width: 20.0,
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    c.whatsNumber,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
