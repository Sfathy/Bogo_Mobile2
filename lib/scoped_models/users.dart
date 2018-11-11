import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class UsersModel extends Model {
  final String baseURL = 'http://192.168.1.121/api/';
  User _authenticatedUser;
  User get AuthenticatedUser{
    return _authenticatedUser;
  }
  void signUp(User user) async {
    //http.Response response = await http.get(baseURL + 'values');
    _authenticatedUser = User(userName:user.userName,token:'token',id: 0  );
    notifyListeners();
    print(_authenticatedUser.userName);
   // print(json.decode(response.body));
    //return true;
  }
  void getValues() async{
    http.Response response = await http.get(baseURL + 'values',
        headers: {"Content-Type": "application/json","Authorization":"bearer " + _authenticatedUser.token});
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
        _authenticatedUser = User(userName:responseData['userName'],token:responseData['token'],id: 0  );
        message = 'Authontication succeeded';
      }
    }
    return {'success': !hasError, 'message': message};
    //return truel
  }
}
