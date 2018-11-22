import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class UsersModel extends Model {
  //final String baseURL = 'http://192.168.8.102:52994/api/Auth/';
  final String baseURL = 'http://192.168.1.100:52994/api/';
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
  Future<Map<String, dynamic>> getCategoryList()async{
    Map<String, dynamic> responseData = {'success': 'false', 'message': 'Error while communicating server'};
    http.Response response = await http.get(baseURL + 'Category/get');
    print('get cat response: ' +response.body.toString());
    if (response.statusCode == 200) {
      responseData = json.decode(response.body);
    }
    print(responseData);
    return responseData;
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
            firstName: responseData['user']['firstName']);
            print('authonticated user: '+_authenticatedUser.toString());
        message = 'Authontication succeeded';
      }
    }
    print(message);
    return {'success': !hasError, 'message': message};
    //return truel
  }
}
