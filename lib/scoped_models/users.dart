import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/categoty.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersModel extends Model {
  final String baseURL = 'http://192.168.8.100:52994/api/';
  //final String baseURL = 'http://192.168.1.198:52994/api/';
  User _authenticatedUser;
  List<Category> _catlist = new List<Category>();
  List<Coupon> _couponList = new List<Coupon>();
  List<Platinum> _platinumList = new List<Platinum>();
  List<Category> get CatList {
    return _catlist;
  }
  List<String> _cartItems;
  void getCartItems()async{
    http.Response response = await http.get(baseURL + 'Customer/getCart/' + _authenticatedUser.id.toString());
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print(data);
      if (data != null) {
        String c;
          List<String> carts = new List<String>();
          for (var j = 0; j < data.length; j++) {
            //f = cs[j]['availableFeatures'];
            c =  data[j];
              carts.add(c);
          }
          _cartItems = carts;
      }
    }
  }
  List<String> get CartItems{
    if(_cartItems == null||_cartItems.length==0){
      getCartItems();
      notifyListeners();
    }
    return _cartItems;
  }
  List<Coupon> get CouponList {
    if (_couponList==null||_couponList.length==0)
    {
      //get coupon list from the server
      getCouponList();
      notifyListeners();
    }
    return _couponList;
  }
  List<Platinum> get PlatinumList{
 if (_platinumList==null||_platinumList.length==0)
    {
      //get coupon list from the server
      getPlatinumList();
      notifyListeners();
    }
    return _platinumList;
  }
   void getPlatinumList() async{
    http.Response response = await http.get(baseURL + 'Customer/getPlatinum/' + _authenticatedUser.id.toString());
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print(data);
      if (data != null) {
        Platinum c;
          List<Platinum> coupons = new List<Platinum>();
          for (var j = 0; j < data.length; j++) {
            //f = cs[j]['availableFeatures'];
            c = new Platinum(
              id: data[j]['id'],
              title: data[j]['title'],
              description: data[j]['description'],
              faceBookLink: data[j]['faceBookLink'],
              image: data[j]['image'],
              whatsNumber: data[j]['whatsNumber'],
            );
              coupons.add(c);
          }
          _platinumList = coupons;
      }
    }
   }
  void getCouponList() async{
    http.Response response = await http.get(baseURL + 'Customer/getCoupon/' + _authenticatedUser.id.toString());
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print(data);
      if (data != null) {
        Coupon c;
          List<Coupon> coupons = new List<Coupon>();
          for (var j = 0; j < data.length; j++) {
            //f = cs[j]['availableFeatures'];
            c = new Coupon(
              id: data[j]['id'],
              validTillEN:
                  data[j]['validTillEN'] != null ? data[j]['validTillEN'] : '',
              validTillAR:
                  data[j]['validTillAR'] != null ? data[j]['validTillAR'] : '',
              image: data[j]['image'] != null ? data[j]['image'] : '',
              icon: data[j]['icon'] != null ? data[j]['icon'] : '',
              descriptionAR:
                  data[j]['descriptionAR'] != null ? data[j]['descriptionAR'] : '',
              descriptionEN:
                  data[j]['descriptionEN'] != null ? data[j]['descriptionEN'] : '',
            );
              coupons.add(c);
          }
          _couponList = coupons;
      }
    }
    
  }

  User get AuthenticatedUser {
    return _authenticatedUser;
  }

  String get ImagePath {
    return "http://bogo.dragonssolution.com/uploads/img/";
  }

  String get DefaultImage {
    return "assets/HomePage/Pizza-Hut.png";
  }

  Future<Map<String, dynamic>> signUp(User user) async {
    /*
      {
        "FirstName": "Hossam",
        "LastName": "Fathy",
        "Mobile": "0101919324",
        "FacebookName": "soso",
        "Gender": 0,
        "BirthDate": "1987-09-30",
        "LocationId": null,
        "LatestIMEI": null,
        "ProfilePicture": null,
        "UserName": "semsem",
        "Email": "semsem9000@gmail.com",
        "Password":"123456"
    }
    {FirstName: Hossam, 
    LastName: Fathy, 
    Mobile: 01000924244, 
    FacebookName: soso, 
    Gender: 0, 
    BirthDate: 1987-09-30, 
    LocationId: 0, 
    LatestIMEI: 0, 
    ProfilePicture: test, 
    UserName: user@bogo.com, 
    Email: user@bogo.com, 
    Password: 123456}
    */
    Map<String, dynamic> userData = {
      'FirstName': user.firstName,
      'LastName': user.lastName,
      'Mobile': user.mobileNumber,
      'FacebookName': 'soso',
      'Gender': user.gender,
      'BirthDate': user.birthDate,
      'LocationId': null,
      'LatestIMEI': null,
      'ProfilePicture': 'test',
      'UserName': user.email,
      'Email': user.email,
      'Password': user.password
    };
    http.Response response = await http.post(baseURL + 'Auth/insertuser',
        headers: {'content-type': 'application/json'},
        body: json.encode(userData));
    // print('sign up response:' + response.toString());

    return login(user.email, user.password);
    //_authenticatedUser = User(userName:user.userName,token:'token',id: 0  );
    //notifyListeners();
    //print(_authenticatedUser.userName);
    // print(json.decode(response.body));
    //return true;
  }

  void getValues() async {
    http.Response response = await http.get(baseURL + 'values', headers: {
      "Content-Type": "application/json",
      "Authorization": "bearer " + _authenticatedUser.token
    });
    print(json.decode(response.body));
  }

  //Future<List<Map<String, dynamic>> getCategoryList()async{
  Future<List> getCategoryList() async {
    //Future<Map<String, dynamic>> responseData= {'success': 'false', 'message': 'Error while communicating server'};
    http.Response response = await http.get(baseURL + 'Category/get');
    List res;
    // print('get cat response: ' + response.body.toString());
    if (response.statusCode == 200) {
      res = json.decode(response.body);
      var data = res; //json.decode(response.body);
      if (data != null) {
        var _catlst = new List<Category>();
        List<Brand> brands = new List<Brand>();
        Brand b;
        Category c;
        for (var i = 0; i < data.length; i++) {
          brands = new List<Brand>();
          List bs = data[i]['brandsVM'];
          if (bs != null) {
            for (var j = 0; j < bs.length; j++) {
              b = new Brand(
                id: bs[j]['id'],
                brandName: bs[j]['name'] != null ? bs[j]['name'] : '',
                brandDescription: bs[j]['brandDescription'] != null
                    ? bs[j]['brandDescription']
                    : '',
                brandImage:
                    bs[j]['logoImage'] != null ? bs[j]['logoImage'] : '',
              );
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
      }
    }

    // print(res);
    //return res;
    return _catlist;
  }

  Future<BrandDetails> getBrandDetails(int brandID) async {
    //Future<Map<String, dynamic>> responseData= {'success': 'false', 'message': 'Error while communicating server'};
    http.Response response =
        await http.get(baseURL + 'Brands/get/' + brandID.toString());
    print('brand details response: ' + response.body.toString());
    BrandDetails res;
    var data;
    List<Branch> branches;
    List<Coupon> coupons;
    List<Platinum> platinums;
    //   print('get cat response: ' + response.body.toString());
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      if (data != null) {
        Branch b;
        Coupon c;
        Platinum p;
        //res.id = int.parse( data['id'].toString());
        branches = new List<Branch>();
        List bs = data['branches'];
        List cs = data['coupons'];
        List ps = data['platinums'];
        List<dynamic> f;
        List<String> fs;
        if (bs != null) {
          for (var j = 0; j < bs.length; j++) {
            f = bs[j]['availableFeatures'];
            fs = new List<String>();
            if(f!=null){
                for (var i = 0; i < f.length; i++) {
                  fs.add(f[i].toString());
                }
            }
            b = new Branch(
              id: bs[j]['id'],
              branchName:
                  bs[j]['branchName'] != null ? bs[j]['branchName'] : '',
              branchAddress:
                  bs[j]['branchAddress'] != null ? bs[j]['branchAddress'] : '',
              branchLocation: bs[j]['branchLocation'] != null
                  ? bs[j]['branchLocation']
                  : '',
              branchTelephone: bs[j]['branchTelephone'] != null
                  ? bs[j]['branchTelephone']
                  : '',
              availableFeatures: fs,
            );
            branches.add(b);
          }
        }

        if (cs != null) {
          coupons = new List<Coupon>();
          for (var j = 0; j < cs.length; j++) {
            f = cs[j]['availableFeatures'];
            c = new Coupon(
              id: cs[j]['id'],
              validTillEN:
                  cs[j]['validTillEN'] != null ? cs[j]['validTillEN'] : '',
              validTillAR:
                  cs[j]['validTillAR'] != null ? cs[j]['validTillAR'] : '',
              image: cs[j]['image'] != null ? cs[j]['image'] : '',
              icon: cs[j]['icon'] != null ? cs[j]['icon'] : '',
              descriptionAR:
                  cs[j]['descriptionAR'] != null ? cs[j]['descriptionAR'] : '',
              descriptionEN:
                  cs[j]['descriptionEN'] != null ? cs[j]['descriptionEN'] : '',
            );
            coupons.add(c);
          }
        }
        if (ps != null) {
          platinums = new List<Platinum>();
          for (var j = 0; j < ps.length; j++) {
            //f = cs[j]['availableFeatures'];
            p = new Platinum(
              id: ps[j]['id'],
             description: ps[j]['description'],
             title: ps[j]['title'],
             faceBookLink: ps[j]['faceBookLink'],
             image: ps[j]['image'],
             whatsNumber: ps[j]['whatsNumber'],
            );
            platinums.add(p);
          }
        }
        res = new BrandDetails(
            id: int.parse(data['id'].toString()),
            brandName: data['brandName'].toString(),
            brandDescription: data['brandDescription'].toString(),
            brandPhone: data['brandPhone'].toString(),
            brandLocation: data['brandLocation'].toString(),
            brandIcon: data['brandIcon'].toString(),
            brandImage: data['brandImage'].toString(),
            brandTwttierLink: data['brandTwttierLink'].toString(),
            brandFaceLink: data['brandFaceLink'].toString(),
            branches: branches,
            platinums: platinums,
            coupons: coupons);
      }
    }
    print(res);
    return res;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, dynamic> user = {'username': email, 'password': password};
    http.Response response = await http.post(baseURL + 'Auth/Login',
        headers: {"Content-Type": "application/json"}, body: json.encode(user));
    bool hasError = true;
    String message = 'user name not exist or password is not valid';
    //http.Response response = await http.post(baseURL + 'login?username=' + email + '&password=' + password );
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData.toString());
      if (responseData.containsKey('token')) {
        hasError = false;

        _authenticatedUser = User(
            userName: responseData['user']['userName'],
            token: responseData['token'],
            email: responseData['user']['email'],
            id: 0,
            mobileNumber: responseData['user']['Mobile'],
            address: '',
            birthDate: responseData['user']['BirthDate'],
            lastName: responseData['user']['lastName'],
            gender: responseData['user']['gender'],
            firstName: responseData['user']['firstName'],
            image: '');
        print('authonticated user: ' + _authenticatedUser.toString());
        message = 'Authontication succeeded';
        final SharedPreferences preps = await SharedPreferences.getInstance();
        preps.setString('token', responseData['token'].toString());
        preps.setString(
            'userName', responseData['user']['userName'].toString());
        preps.setString('email', responseData['user']['email'].toString());
        preps.setString(
            'mobileNumber', responseData['user']['Mobile'].toString());
        preps.setString(
            'birthDate', responseData['user']['BirthDate'].toString());
        preps.setString(
            'lastName', responseData['user']['lastName'].toString());
        preps.setString(
            'firstName', responseData['user']['firstName'].toString());
        preps.setString('gender', responseData['user']['gender'].toString());

        //await initializeCat();
      }
    }
    print(message);
    return {'success': !hasError, 'message': message};
    //return truel
  }

  void AutoAuth() async {
    final SharedPreferences preps = await SharedPreferences.getInstance();
    final String token = preps.getString('token');
    if (token != null) {
      final String userName = preps.getString('userName');
      final String email = preps.getString('email');
      final String mobileNumber = preps.getString('mobileNumber');
      final String birthDate = preps.getString('birthDate');
      final String lastName = preps.getString('lastName');
      final String firstName = preps.getString('firstName');
      final String gender = preps.getString('gender');
      _authenticatedUser = User(
          userName: userName,
          token: token,
          email: email,
          id: 0,
          mobileNumber: mobileNumber,
          address: '',
          //birthDate:DateTime.parse( birthDate),
          lastName: lastName,
          gender: int.parse(gender),
          firstName: firstName);
      notifyListeners();
    }
  }
}
