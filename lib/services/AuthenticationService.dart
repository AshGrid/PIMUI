import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final String baseUrl = 'http://192.168.1.17:3000';

  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: json.encode({'data': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Parse response and return true if login successful
        Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          // Store token or user data in shared preferences or state management
          // For example, you can store the token like this:
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', responseData['token']);
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      // Handle network or server error
      print('Error in login: $e');
      return false;
    }
  }

  Future<bool> signup(
      String fName, String email, String phoneNumber, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/registration'),
        body: json.encode({
          'fName': fName,
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        // Parse response and return true if signup successful
        Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      // Handle network or server error
      print('Error in signup: $e');
      return false;
    }
  }

  // Add other methods for forget password, OTP verification, etc.
}
