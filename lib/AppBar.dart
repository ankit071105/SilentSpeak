import 'package:flutter/material.dart';
import 'package:news/post.dart';
import 'package:news/profile.dart';

import 'myStyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool isLoggedIn = false;
  bool isSigningUp = false;

  void login() {
    setState(() {
      isLoggedIn = true;
    });
  }

  void signUp() {
    setState(() {
      isSigningUp = true;
    });
  }

  void backToLogin() {
    setState(() {
      isSigningUp = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return MainContent();
    } else {
      return isSigningUp
          ? SignUpPage(signUpCallback: signUp, backToLoginCallback: backToLogin)
          : LoginPage(loginCallback: login, signUpCallback: signUp);
    }
  }
}

class LoginPage extends StatelessWidget {
  final VoidCallback loginCallback;
  final VoidCallback signUpCallback;

  const LoginPage({Key? key, required this.loginCallback, required this.signUpCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5fffc2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Hero(
                tag: 'logo',
                child: CircleAvatar(
                  radius: 200,
                  backgroundImage: AssetImage('assets/images/120.png'), // Replace 'assets/logo_image.png' with your image path
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email or Phone Number',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: loginCallback,
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: signUpCallback,
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final VoidCallback signUpCallback;
  final VoidCallback backToLoginCallback;

  const SignUpPage({Key? key, required this.signUpCallback, required this.backToLoginCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5fffc2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Hero(
                tag: 'logo',
                child: CircleAvatar(
                  radius: 200,
                  backgroundImage: AssetImage('assets/images/120.png'), // Replace 'assets/logo_image.png' with your image path
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: signUpCallback,
                        child: Text('Sign Up'),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: backToLoginCallback,
                      child: Text('Already Logged In?'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/120.png'), // Replace 'assets/logo_image.png' with your image path
                  ),
                ),
                Profile(),
                Post(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
