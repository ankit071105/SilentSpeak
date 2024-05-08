import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Color(0xffd1ff8b),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Designed by Ankit Kumar ©',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {}, // Empty function
            child: Text('More Projects'), // Adjust button text as needed
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Stack(
        children: [
          // Main content of the page
          Container(
            color: Colors.white, // Adjust background color as needed
            child: Center(
              child: Text(
                'Main Content Here',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Footer section fixed to the bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Footer(),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

