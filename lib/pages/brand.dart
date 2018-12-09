import 'package:flutter/material.dart';

import '../models/categoty.dart';

class BrandPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BrandPageState();
  }
}

class BrandPageState extends State<BrandPage> {
  BuildContext formContext;
  double width;
  double height;
  double devicePixelRatio;
  /*
      assets/Branches/air.png
    - assets/Branches/erea.png
    - assets/Branches/face-icon-for-branches.png
    - assets/Branches/parking.png
    - assets/Branches/phone.png
    - assets/Branches/smoking.png
    - assets/Branches/telegram-icon-for-branches.png
    - assets/Branches/twttier-icon-for-branches.png
    - assets/Branches/background-3-tabs.png
  */
  BrandDetails brand = new BrandDetails(
      brandName: 'Cook Door Resturant',
      brandDescription: 'Terms & Condition',
      brandImage: 'assets/Branches/img-product.jpg',
      brandIcon: 'assets/HomePage/Starbucks.png',
      id: 1,
      branches: [
        new Branch(
            id: 0,
            branchName: '5th Settlement',
            branchAddress: 'Gallaria Mall, 90 Street',
            branchLocation: '',
            branchTelephone: '01000',
            availableFeatures: [
              'assets/Branches/air.png',
              'assets/Branches/erea.png',
              'assets/Branches/parking.png',
              'assets/Branches/smoking.png',
            ]),
        new Branch(
            id: 0,
            branchName: 'Nasr City',
            branchAddress: 'City Stars mall',
            branchLocation: '',
            branchTelephone: '01000',
            availableFeatures: [
              'assets/Branches/air.png',
              'assets/Branches/erea.png',
              'assets/Branches/parking.png',
              'assets/Branches/smoking.png',
            ]),
        new Branch(
            id: 0,
            branchName: 'Nasr City',
            branchAddress: 'City Center Mall',
            branchLocation: '',
            branchTelephone: '01000',
            availableFeatures: [
              'assets/Branches/air.png',
              'assets/Branches/erea.png',
              'assets/Branches/parking.png',
              'assets/Branches/smoking.png',
            ]),
      ],
      coupons: [
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
        new Coupon(
            id: 1,
            icon: 'assets/Coupons/logo-bogo-in-coupons.png',
            image: 'assets/Branches/img-product.jpg',
            validTillAR: 'سارى حتى 31 ديسمبر 2018',
            validTillEN: 'valid till 31 decemper 2018',
            descriptionAR:
                'ندعوك انت وضيفك للاستمتاع بروديو باربكيو تشيز برجر  ساندوتش مجانا عند شراء روديو باربكيو تشيز برجر بنفس القيمه',
            descriptionEN:
                'you and your guest are cordially invited to enjoy one complimentery Rodeo BBQ cheese burger sandwitch when a BBQ cheese burger sandwitch is purchased with similar value'),
      ]);

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

  TabController _controller;
  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildUserName(),
        _buildLocation(),
        _buildBrandImage(),
        SizedBox(
          height: height / 75,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _buildBrandLogo(),
            _buildBrandText(),
          ],
        ),
        SizedBox(
          height: height / 50,
        ),
        _buildTabs(),
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
              Image.asset('assets/Branches/telegram-icon-for-branches.png',
                  width: 20.0, height: 20.0),
              Image.asset('assets/Branches/twttier-icon-for-branches.png',
                  width: 20.0, height: 20.0),
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
    return Image.asset(
      brand.brandImage,
      width: width,
      height: height / 4,
      fit: BoxFit.fill,
    );
  }

  Widget _buildBrandLogo() {
    return Image.asset(
      brand.brandIcon,
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
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              //shrinkWrap: true,
              children: <Widget>[
                Text(
                  brand.branches[index].branchName,
                  style: TextStyle(color: Color(0xFFAD045D), fontSize: 15.0),
                ),
                Text(
                  brand.branches[index].branchAddress,
                  style: TextStyle(color: Color(0xFFAD045D), fontSize: 15.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildFeatureImages(index),
                )
              ],
            ),
          ),
          SizedBox(
            width: width / 5,
          ),
          Container(
            width: width / 4,
            height: height / 7,
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'assets/Branches/phone.png',
                  width: 35.0,
                  height: 35.0,
                ),
                Image.asset(
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

    for (var i = 0;
        i < brand.branches[branchIndex].availableFeatures.length;
        i++) {
      features.add(Image.asset(
        brand.branches[branchIndex].availableFeatures[i],
        width: 35.0,
        height: 35.0,
      ));
    }
    return features;
  }

  Widget _buildBraches() {
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
    Coupon c = brand.coupons[index];
    return Container(
      width: width/5,
      height: height,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        
      ),
      //alignment: Alignment.center,
      child: ListView(
        children: <Widget>[
          Image.asset(c.icon,width: 35.0,height: 35.0,),
          Center(child:  Text(c.validTillAR, style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.redAccent, fontSize: 5.0,),),),
          Center(child:  Text(c.validTillEN,style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.redAccent,fontSize: 5.0),),),
          Image.asset(c.image),
          Center(child:  Text(c.descriptionAR,style: TextStyle(fontWeight:FontWeight.bold ,fontSize: 5.0),),),
          Center(child:  Text(c.descriptionEN,style: TextStyle(fontWeight:FontWeight.bold ,fontSize: 5.0),),),
        ],
      ),
    );
  }

  List<Widget> _buildCouponItems() {
    List<Widget> coupons = new List<Widget>();
    Widget coupon;
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
      childAspectRatio: (width/4)/(height/4),
      children: _buildCouponItems(),
    );
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
                  Icon(Icons.directions_bike),
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
