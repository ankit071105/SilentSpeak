import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/post4.dart';

class Single extends StatefulWidget {
  // User information
  final String name;
  final String email;
  final String phoneNumber;
  final String pictureUrl;

  // Constructor to initialize user information
  Single({required this.name, required this.email, required this.phoneNumber, required this.pictureUrl});

  @override
  _SingleState createState() => _SingleState();
}

class _SingleState extends State<Single> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late List<Color> _possibleColors;
  late int _currentColorIndex;

  @override
  void initState() {
    super.initState();

    _possibleColors = [
      Color(0xffe8081b),
      Color(0xfffc3ee3),
      Color(0xff0d164d),
      Color(0xffaf6df5),
      Color(0xff7decca),
      Color(0xff7bec8e),
      Color(0xffffe377),
      Color(0xffff610b),
      Color(0xff5feae5),
      Color(0xff68058f),
    ];

    _currentColorIndex = 0;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _colorAnimation = ColorTween(
      begin: _possibleColors[_currentColorIndex],
      end: _possibleColors[(_currentColorIndex + 1) % _possibleColors.length],
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentColorIndex = (_currentColorIndex + 1) % _possibleColors.length;
        _colorAnimation = ColorTween(
          begin: _possibleColors[_currentColorIndex],
          end: _possibleColors[(_currentColorIndex + 1) % _possibleColors.length],
        ).animate(_controller);
        _controller.forward(from: 0);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'), // Title for the app bar
        backgroundColor: Color(0xff4a1a85), // Set app bar background color to black
        leading: IconButton( // Leading widget for back button
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back when button is pressed
          },
        ),
      ),
      backgroundColor: _colorAnimation.value, // Set background color to dynamically changing color
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff1be0d0), // Background color
          borderRadius: BorderRadius.circular(5), // Adjust border radius as needed
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.75), // Shadow color
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(20), // Padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.pictureUrl), // Use the provided pictureUrl
              radius: 100, // Adjust radius as needed
            ),
            SizedBox(height: 20), // Spacer
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Color(0xff330e52),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // User email
            Text(
              widget.email,
              style: TextStyle(
                fontSize: 26,
                color: Color(0xff330e52),
              ),
            ),
            SizedBox(height: 20), // Spacer

            // User phone number
            Text(
              widget.phoneNumber,
              style: TextStyle(
                fontSize: 26,
                color: Color(0xff330e52),
              ),
            ),
            SizedBox(height: 20), // Spacer
            Transform.scale(
              scale: 2.0,
              child: IconButton(
                icon: Icon(Icons.info_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Post4()),
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
