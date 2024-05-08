import 'package:flutter/material.dart';
import 'package:news/singlepost.dart';
import 'package:news/stone.dart';

import 'game.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000), // Changed duration to 0.5 seconds
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
      padding: EdgeInsets.only(top: 50, left: 20, right: 20), // Added padding for top, left, and right
      width: double.infinity,
      height: 370,
      decoration: BoxDecoration(
        color: Color(0xff20002c),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(130.0),
          bottomRight: Radius.circular(0.0),
        ),
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Align children at the center horizontally
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded( // Added Expanded to prevent overflow
                    child: Padding(
                      padding: EdgeInsets.only(left: _slideAnimation.value),
                      child: Opacity(
                        opacity: _fadeInAnimation.value,
                        child: Text(
                          'Silent-Speak',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffd2e366),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff66e3c2),
                      borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                    ),
                    child: IconButton(
                      icon: Icon(Icons.perm_contact_cal_sharp,),
                      onPressed: () {
                        // Navigate to the Single screen with user details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Single(name: 'Ankit Kumar', email: 'ankitkr@gmail.com', phoneNumber: '9031358194', pictureUrl: 'assets/images/1.jpeg',),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff66e3c2),
                      borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                    ),
                    child: IconButton(
                      icon: Icon(Icons.games), // Added button with games icon
                      onPressed: () {
                        // Navigate to the Stone Paper Scissors game screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Transform.translate(
                offset: Offset(-_slideAnimation.value, 0),
                child: Center( // Center the avatar image
                  child: Container(
                    child: CircleAvatar(
                      radius: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60), // Match the border radius of the container
                        child: Image.asset(
                          "assets/images/32.png",
                          width:200, // Adjust the width and height as needed
                          height: 200, // Adjust the width and height as needed
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Opacity(
                opacity: _fadeInAnimation.value,
                child: Padding(
                  padding: EdgeInsets.only(left: _slideAnimation.value), // Adjusted padding here
                  child: Text(
                    'Learn Your Voice',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffa9e76f),
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
