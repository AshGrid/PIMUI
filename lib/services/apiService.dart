import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService {

static const baseUrl = "http://localhost:3000";
// Function to register a user
Future<void> registerUser(String fName, String email, String phoneNumber, String password) async {
  try {
    var url = Uri.parse('$baseUrl/api/auth/registration');
    var response = await http.post(url, body: {
      'fName': fName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password
    });
    if (response.statusCode == 201) {
      print("User registered successfully");
    } else {
      print("Failed to register user");
    }
  } catch (error) {
    print("Error: $error");
  }
}

// Function to login with email and password
Future<bool> loginWithEmailPassword(String email, String password) async {
  try {
    var url = Uri.parse('$baseUrl/api/auth/login/email');
    var response = await http.post(url, body: {
      'email': email,
      'password': password
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      print("Failed to login with email and password");
      return false;
    }
  } catch (error) {
    print("Error: $error");
  }
  return false;
}

// Function to login with Google OAuth token
Future<void> loginWithGoogle(String idToken) async {
  try {
    var url = Uri.parse('$baseUrl/api/auth/login/google');
    var response = await http.post(url, body: {
      'idToken': idToken
    });
    if (response.statusCode == 200) {
      print("User logged in with Google successfully");
    } else {
      print("Failed to login with Google");
    }
  } catch (error) {
    print("Error: $error");
  }
}

// Function to login with Facebook OAuth token
Future<void> loginWithFacebook(String accessToken) async {
  try {
    var url = Uri.parse('$baseUrl/api/auth/login/facebook');
    var response = await http.post(url, body: {
      'accessToken': accessToken
    });
    if (response.statusCode == 200) {
      print("User logged in with Facebook successfully");
    } else {
      print("Failed to login with Facebook");
    }
  } catch (error) {
    print("Error: $error");
  }
}


 Future<bool> requestPasswordReset(String email) async {
    var url = Uri.parse('$baseUrl/user/reset-password/request'); // Adjust the path as per your server's API
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        // Handle the positive case
        print("Password reset email sent successfully");
        return true;
      } else {
        // Handle server errors or user not found
        print("Failed to send password reset email: ${response.body}");
        return false;
      }
    } catch (e) {
      // Handle errors in sending the request
      print("Error sending password reset request: $e");
      return false;
    }
  }


  Future<bool> resetPassword(String email, String token, String newPassword) async {
    var url = Uri.parse('$baseUrl/reset-password'); // Ensure this matches your API endpoint
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'token': token,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        print("Password reset successfully");
        return true;
      } else {
        print("Failed to reset password: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error resetting password: $e");
      return false;
    }
  }
}