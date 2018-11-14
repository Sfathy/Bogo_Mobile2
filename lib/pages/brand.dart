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
      coupons: []);

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
  Widget _buildSortButton(){
    return Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 20.0),
         // width: 150.0,
          child: RaisedButton(
            color: Color(0xFFAD045D),
            textColor: Colors.white,
            
            shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(75.0)),
                  
            child: Text('A-Z'),
            onPressed: (){},
          ),
        ); 
  }
  Widget _buildBranchCard(BuildContext build,int index){
    return Container(
       decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(20.0),
        color: Colors.white54,
        /*image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage('assets/Branches/background-3-tabs.png'),
            
            fit: BoxFit.fill),*/
      ),
      width: width,
      height: height/8,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child:Row(children: <Widget>[
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //shrinkWrap: true,
          children: <Widget>[
          Text(brand.branches[index].branchName,style: TextStyle(color: Color(0xFFAD045D),fontSize: 10.0),),
          Text(brand.branches[index].branchAddress,style: TextStyle(color: Color(0xFFAD045D),fontSize: 10.0),),
          Row(children: <Widget>[
            Image.asset(brand.branches[index].availableFeatures[0],width: 30.0,height: 30.0,),
          ],)
        ],)
      ],),
    );
  }
  Widget _buildBraches() {

    return Column(
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
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Color(0xFFAD045D),
            indicatorPadding: EdgeInsets.all(20.0),
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
              height: height / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  //image: AssetImage('assetName'),
                  color: Color.fromARGB(150, 0, 0, 0)),
              child: TabBarView(
                children: [
                  _buildBraches(),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    /*Container(
      width: width,
      height: height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage('assets/Branches/background-3-tabs.png'),
            fit: BoxFit.fill),
      ),
      child: Container(),
    );*/
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
