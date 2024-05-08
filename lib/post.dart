import 'package:flutter/material.dart';
import 'package:news/Footer.dart';
import 'package:news/home.dart';

import 'package:news/post3.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 390),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              Home(),
              SizedBox(height: 40),
              Post3(),
              SizedBox(height: 40),
              Footer(),
              // Assuming Morse is a widget
            ],
          ),
        ],
      ),
    );
  }
}