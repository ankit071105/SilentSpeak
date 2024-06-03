import 'package:flutter/material.dart';
import 'package:news/singlepost.dart';
import 'package:news/stone.dart';
import 'package:news/video.dart';

import 'game.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _shadowAnimation; // New animation for the box shadow

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    _slideAnimation = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _shadowAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut), // Adjust the interval for when the shadow animation occurs
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30, right: 30),
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        color: Color(0xff30a0af),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: _shadowAnimation.value, // Apply animation to spreadRadius
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: _slideAnimation.value),
                      child: Opacity(
                        opacity: _fadeInAnimation.value,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          // Set the desired radius here
                          child: Image.asset(
                            'assets/images/1200.png',
                            width: 100.0, // Set width as needed
                            height: 100.0, // Set height as needed
                            fit: BoxFit
                                .cover, // Ensures the image covers the container
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff66e3df),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.perm_contact_cal_sharp,),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Single(name: 'Ankit Kumar',
                                  email: 'ankitkr@gmail.com',
                                  phoneNumber: '9031358194',
                                  pictureUrl: 'assets/images/1.jpeg',),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff54efef),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.games),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Hello(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff54efef),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.video_collection_sharp),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Helo(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Opacity(
                opacity: _fadeInAnimation.value,
                child: Padding(
                  padding: EdgeInsets.only(left: _slideAnimation.value),
                  child: Text(
                    'Learn Your Voice',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7efff4),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
