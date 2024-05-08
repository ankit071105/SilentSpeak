import 'package:flutter/material.dart';
import 'crosszero.dart';
import 'filp.dart';
import 'stone.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageAnimation;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Set the duration to 5 seconds
    );

    _imageAnimation = Tween<double>(begin: -500, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );

    _buttonAnimation = Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );

    _controller.forward(); // Start the animation
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
        title: Text('Silent Speak Games'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color(0xFF010621), // Set the background color to black
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image above the button
              AnimatedBuilder(
                animation: _imageAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_imageAnimation.value, 0),
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    'assets/images/game.jpeg', // Change this to the path of your image
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
              SlideTransition(
                position: _buttonAnimation,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to StonePaperScissors widget when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StonePaperScissors()),
                        );
                      },
                      child: Text('Elemental Clash'),
                    ),
                    SizedBox(height: 20.0),
                    // Additional button and text
                    Text(
                      'Stone Paper Scissor',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff83f2ff),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to GameBoard widget when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GameBoard()),
                        );
                      },
                      child: Text('Tic-Tac-Go'),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Cross Zero',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff83f2ff),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to FlipFlop widget when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FlipFlopGame()),
                        );
                      },
                      child: Text('Flip-Flop'),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Try your luck with the Flip-Flop game!',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff83f2ff),
                        fontWeight: FontWeight.bold,
                      ),
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
