import 'package:flutter/material.dart';
import 'package:news/myStyle.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    // Delay showing text by 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 2), // Image animation duration
          transform: _showText
              ? Matrix4.translationValues(0, 0, 0)
              : Matrix4.translationValues(500, 0, 0), // Slide in from the right
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff6ad7ff),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                topLeft: Radius.circular(50.0),
              ),
            ),
            margin: EdgeInsets.only(left: 20.0),
            height: 400,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
              ),
              child: Image.asset(
                'assets/images/123.png', // Replace with the path to your image asset
                width: 400, // Set the desired width
                height: 400, // Set the desired height
              ),
            ),
          ),
        ),
        SizedBox(height: 20), // Add space between the image and the description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AnimatedOpacity(
            opacity: _showText ? 1.0 : 0.0,
            duration: Duration(seconds: 1), // Adjust opacity animation duration as needed
            child: _showText
                ? AnimatedContainer(
              duration: Duration(seconds: 8), // Adjust zoom-out animation duration as needed
              transform: _showText
                  ? Matrix4.identity()
                  : Matrix4.diagonal3Values(0, 0, 0),
              child: Column(
                children: [
                  Text(
                    'Dots (·): A dot represents a short signal or a "di" in Morse code. It is the basic unit of time in Morse code.',
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2e063a),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Dashes (–): A dash represents a longer signal or a "dah" in Morse code. It is equivalent to three dots in duration.',
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2e063a),
                    ),
                  ),
                ],
              ),
            )
                : SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
