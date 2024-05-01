import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sneakers_app/pages/HomePage/course_screen.dart';
import 'package:sneakers_app/pages/Loginpages/resset_page.dart';
import 'package:sneakers_app/pages/Loginpages/singup_page.dart';
import 'package:sneakers_app/pages/Loginpages/theme/theme.dart';
import 'package:sneakers_app/pages/Loginpages/welcome_page.dart';
import 'package:sneakers_app/pages/Loginpages/widgets/custom_scaffold.dart';
import 'package:sneakers_app/pages/HomePage/details.dart';
import 'package:sneakers_app/widgets/base_screen.dart';

import '../../services/apiService.dart';
import 'Profile_Page.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
 final ApiService _apiService = ApiService();
 final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text('AppBar Title'),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(height: 10),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      // Email TextFormField
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      // Password TextFormField
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      // Remember me checkbox and Forget Password link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary,
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Naviguer vers la page de réinitialisation du mot de passe
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Resset(),
                                ),
                              );
                            },
                            child: Text(
                              'Forget password?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      // Sign in button
                      SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () async {
      bool loggedIn = await _apiService.loginWithEmailPassword(_emailController.text, _passwordController.text);
      if (loggedIn) {
        Navigator.pushReplacement( // Or Navigator.push if you want to allow back navigation
          context,
          MaterialPageRoute(builder: (context) => HomePage()), // Replace NextPage with your target page
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Failed')),
        );
      }
    },
    child: Text('Sign in'),
  ),
),

                      SizedBox(
                        height: 25.0,
                      ),
                      // Sign in with social media logos
                      Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    GestureDetector(
      onTap: () {
        _apiService.loginWithFacebook;
        print('Facebook logo tapped');
        // Implement Facebook login logic here
      },
      child: Logo(Logos.facebook_f),
    ),
    GestureDetector(
      onTap: () {
        print('Twitter logo tapped');
        // Implement Twitter login logic here
      },
      child: Logo(Logos.twitter),
    ),
    GestureDetector(
      onTap: () {
        print('Google logo tapped');
        // Implement Google login logic here
      },
      child: Logo(Logos.google),
    ),
    GestureDetector(
      onTap: () {
        _apiService.loginWithGoogle;
        print('Apple logo tapped');
        // Implement Apple login logic here
      },
      child: Logo(Logos.apple),
    ),
  ],
),

                      SizedBox(
                        height: 25.0,
                      ),
                      // Don't have an account link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Create account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fonction pour gérer le processus de connexion
  void _signIn() {
    // Simulez un processus de connexion réussi (vous pouvez remplacer cette logique par votre propre authentification)
    try {
      // Si la connexion réussit, naviguez vers BaseScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BaseScreen()),
      );
    } catch (e) {
      // Gérer l'erreur de connexion
    }
  }
}