import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  //for loading
  bool _loading = false;

  get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    //after calling ftn loading true
    setLoading(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          //email and pwd write here from api website reqres.in post login successful api
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('successfull');
        setLoading(false);
      } else {
        setLoading(false);
        print('failed');
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
