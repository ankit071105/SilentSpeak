import 'package:flutter/material.dart';
import 'package:news/contact_us.dart'; // Importing the ContactUsPage

class Post4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff055477),
      appBar: AppBar(
        backgroundColor: Color(0xff441279),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0), // Add padding top and some bottom padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    "assets/images/32.png",
                    width: 500,
                    height: 500,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Morse code is a method used in telecommunication to encode text characters as sequences of two different signal durations, called dots and dashes or dits and dahs. Morse code is named after Samuel Morse, one of the inventors of the telegraph.',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 30),
              Text(
                'History',
                style: TextStyle(fontSize: 36, color: Colors.lightBlueAccent),
              ),
              SizedBox(height: 5),
              Text(
                'Morse code was invented in the early 1830s by Samuel Morse and Alfred Vail. It was initially developed for use in the telegraph, which was one of the earliest forms of long-distance communication. Morse code revolutionized communication by enabling messages to be transmitted quickly and efficiently over long distances.',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 30),
              Text(
                'Usage and Significance',
                style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
              ),
              SizedBox(height: 5),
              Text(
                'Morse code has been widely used in various applications, including maritime communication, aviation, military communication, and amateur radio. It is still used today in certain contexts, although it has largely been replaced by digital communication methods. Despite its decline in usage, Morse code remains culturally significant and is often learned and appreciated by enthusiasts as a form of communication and as a part of history.',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 30),
              Text(
                'Team Members ',
                style: TextStyle(fontSize: 36, color: Colors.white70,),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TeamMember(name: 'Ankit Kumar', image: 'assets/images/11.png'),
                  SizedBox(width: 40),
                  TeamMember(name: 'Avinsh Kumar', image: 'assets/images/215.png'),
                ],
              ),
              SizedBox(height: 50), // Add spacing between team members and footer
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff241946),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Silent Speak',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the ContactUsPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()),
                  );
                },
                child: Text('Contact Us'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamMember extends StatelessWidget {
  final String name;
  final String image;

  TeamMember({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
