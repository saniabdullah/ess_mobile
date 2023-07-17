import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ess_mobile/helpers/url_helper.dart';
import 'package:ess_mobile/models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final String _apiUrl = API_URL;

  Future<void> signIn(String nrp, String password) async {
    try {
      final response = await http.post(Uri.parse('$_apiUrl/sign_in'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'nrp': nrp,
            'password': password,
          }));

      print('response');
      final responseData = jsonDecode(response.body);

      if (responseData['message'] != 'Success') {
        throw HttpException(responseData['message']);
      }

      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isUserLogin', true);
      prefs.setString('userId', responseData['data']['nrp']);
      prefs.setString('entity', responseData['data']['entity'].toString());

      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');

      final response = await http.get(Uri.parse('$_apiUrl/sign_out/$userId'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      final responseData = jsonDecode(response.body);

      if (responseData['message'] != 'Success') {
        throw HttpException(responseData['message']);
      }

      prefs.remove('isUserLogin');
      prefs.remove('userId');
    } catch (e) {
      throw e;
    }
  }

  Future<void> checkDeviceId(String nrp, dynamic deviceDataId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      final response = await http.post(
          Uri.parse('http://202.165.33.98/api/check_device'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{'nrp': nrp, 'deviceid': deviceDataId}));

      final responseData = jsonDecode(response.body);

      if (responseData['message'] != 'Success') {
        throw HttpException(responseData['message']);
      }
    } catch (e) {
      throw e;
    }
  }
}
