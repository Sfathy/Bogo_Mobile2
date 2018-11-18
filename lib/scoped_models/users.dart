import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class UsersModel extends Model {
  final String baseURL = 'http://192.168.8.100:52994/api/Auth/';
  User _authenticatedUser;
  User get AuthenticatedUser {
    return _authenticatedUser;
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
      'FirstName': 'Hossam',
      'LastName': 'Fathy',
      'Mobile': user.mobileNumber,
      'FacebookName': 'soso',
      'Gender': 0,
      'BirthDate': '1987-09-30',
      'LocationId': null,
      'LatestIMEI': null,
      'ProfilePicture': 'test',
      'UserName': user.email,
      'Email': user.email,
      'Password': user.password
    };
    http.Response response = await http.post(baseURL + 'insertuser',
        headers: {'content-type': 'application/json'},
        body: json.encode(userData));
    print('sign up response:' + response.toString());
   
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

  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, dynamic> user = {'username': email, 'password': password};
    http.Response response = await http.post(baseURL + 'Login',
        headers: {"Content-Type": "application/json"}, body: json.encode(user));
    bool hasError = true;
    String message = 'user name not exist or password is not valid';
    //http.Response response = await http.post(baseURL + 'login?username=' + email + '&password=' + password );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData.containsKey('token')) {
        hasError = false;
        _authenticatedUser = User(
            userName: responseData['userName'],
            token: responseData['token'],
            id: 0,
            mobileNumber: responseData['Mobile'],
            address: '',
            birthDate: responseData['BirthDate']);
        message = 'Authontication succeeded';
      }
    }
    return {'success': !hasError, 'message': message};
    //return truel
  }
}
