import 'package:flutter/material.dart';
import 'package:news/post.dart';
import 'main.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff8fffe1), // Light blue background
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Moved Silent Speak heading to the top
              Text(
                'Silent Speak',
                style: TextStyle(
                  fontSize: 28, // Increased font size
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',// New font
                ),
              ),
              SizedBox(height: 10),
              // Added the bottom quote
              Text(
                'Innovation in communication knows no bounds. With SilentSpeak, we bridge the gap between ability and expression, empowering every voice to be heard',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Futura',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff062549),// New font
                ),
              ),
              SizedBox(height: 30), // Added space between heading and image
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated Image and Text
                    TweenAnimationBuilder(
                        duration: Duration(seconds: 1),
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.scale(
                              scale: value,
                              child: child,
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40), // Adjust the radius as needed
                          child: Image.asset(
                            'assets/images/1209.jpeg', // Replace with your image path
                            height: 250,
                          ),
                        )

                    ),
                    SizedBox(height: 20),
                    // Removed Silent Speak heading from here
                    // Contact Information
                    ContactInfoWidget(),
                    SizedBox(height: 20),
                    // Back Button
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

class ContactInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'Contanct Us ',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Color(0xff2c1234),
            ),
          ),
          onTap: () {
            // Implement email functionality here
          },
        ),
        ListTile(

          leading: Icon(Icons.email),
          title: Text(
            'kumarankit11458@gmail.com',
            style: TextStyle(
              fontFamily: 'Roboto', // New font
            ),
          ),
          onTap: () {
            // Implement email functionality here
          },
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(
            '9031358194',
            style: TextStyle(
              fontFamily: 'Roboto', // New font
            ),
          ),
          onTap: () {
            // Implement phone call functionality here
          },
        ),
      ],
    );
  }
}
