import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: StonePaperScissors(),
  ));
}

class StonePaperScissors extends StatefulWidget {
  @override
  _StonePaperScissorsState createState() => _StonePaperScissorsState();
}

class _StonePaperScissorsState extends State<StonePaperScissors> with SingleTickerProviderStateMixin {
  String? _result;
  IconData? _computerChoice;
  IconData? _playerChoice;
  final _random = Random();
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _showTicTacGo = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(_controller);

    _controller.forward();

    // Add animation to show "Tic-Tac-Go" from the top
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        _showTicTacGo = true;
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
      backgroundColor: Color(0xff0beedb),
      appBar: AppBar(
        title: Text('Stone Paper Scissors'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                color: Color(0xff1b0456),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SlideTransition(
                        position: _offsetAnimation,
                        child: Image.asset(
                          'assets/images/121902.jpeg',
                          width: 250,
                          height: 250,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Choose your move:',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff83f2ff),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _buildChoiceButton(Icons.stacked_line_chart),
                      Text(
                        'Stone (... - --- -. -)',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff83f2ff),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _buildChoiceButton(Icons.file_copy),
                      Text(
                        'Paper (.--. .- .--. . .-)',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff83f2ff),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _buildChoiceButton(Icons.content_cut),
                      Text(
                        'Scissors (... -.-. .. ... ... --- .-...)',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff83f2ff),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      if (_result != null)
                        Center(
                          child: Text(
                            _result!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Color(0xff7bf6d9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceButton(IconData iconData) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(top: 20),
      transform: Matrix4.translationValues(_showTicTacGo ? 0 : -200, 0, 0), // Apply translation animation
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff54ff76),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: IconButton(
          icon: Icon(iconData),
          iconSize: 40.0,
          color: Colors.black,
          onPressed: () {
            if (_playerChoice == null) {
              _play(iconData);
            }
          },
        ),
      ),
    );
  }

  Widget _buildFooter() {
    String? morseCodeResult;
    if (_result != null) {
      morseCodeResult = _convertToMorseCode(_result!);
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      decoration: BoxDecoration(
        color: Color(0xff16074d),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _result = null;
              });
            },
            child: Text('Remove Output'),
          ),
          SizedBox(height: 20),
          if (_result != null)
            Column(
              children: [
                Text(
                  'Morse Code Result:',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xff47ffac),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  morseCodeResult!,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff5af1ff),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Designed by © ankit',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('More Projects'),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Animated widget to make "Tic-Tac-Go" text appear from the top
          SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1, 0), // Start from the right
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInOut,
            )),
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _showTicTacGo ? 1 : 0, // Fade in animation
              child: Text(
                'Tic-Tac-Go',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  String _convertToMorseCode(String text) {
    final Map<String, String> morseCodeMap = {
      'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.', 'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
      'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
      'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-', 'Y': '-.--', 'Z': '--..',
      '1': '.----', '2': '..---', '3': '...--', '4': '....-', '5': '.....',
      '6': '-....', '7': '--...', '8': '---..', '9': '----.', '0': '-----',
      '.': '.-.-.-', ',': '--..--', '?': '..--..', "'": '.----.', '!': '-.-.--',
      '/': '-..-.', '(': '-.--.', ')': '-.--.-', '&': '.-...', ':': '---...',
      ';': '-.-.-.', '=': '-...-', '+': '.-.-.', '-': '-....-', '_': '..--.-',
      '"': '.-..-.', ' ': '...-..-', '@': '.--.-.', ' ': '/',
    };
    List<String?> morseCodeList = text.toUpperCase().split('').map((char) {
      if (morseCodeMap.containsKey(char)) {
        return morseCodeMap[char];
      } else {
        return null;
      }
    }).toList();

    return morseCodeList.join(' ');
  }

  void _play(IconData playerChoice) {
    setState(() {
      _playerChoice = playerChoice;
      _computerChoice = _generateComputerChoice();
      _result = _determineWinner(_playerChoice!, _computerChoice!);
    });

    // Reset player choice after displaying result
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _playerChoice = null;
      });
    });
  }

  IconData _generateComputerChoice() {
    final choices = [
      Icons.stacked_line_chart,
      Icons.file_copy,
      Icons.content_cut,
    ];
    return choices[_random.nextInt(choices.length)];
  }

  String _determineWinner(IconData player, IconData computer) {
    if (player == computer) {
      return 'It\'s a tie!';
    } else if ((player == Icons.stacked_line_chart && computer == Icons.content_cut) ||
        (player == Icons.content_cut && computer == Icons.file_copy) ||
        (player == Icons.file_copy && computer == Icons.stacked_line_chart)) {
      return 'You win!  ${_getChoiceName(_playerChoice!)} beats ${_getChoiceName(_computerChoice!)}.';
    } else {
      return 'You lose! ${_getChoiceName(_computerChoice!)} beats ${_getChoiceName(_playerChoice!)}.';
    }
  }

  String _getChoiceName(IconData choice) {
    if (choice == Icons.stacked_line_chart) {
      return 'Stone';
    } else if (choice == Icons.file_copy) {
      return 'Paper';
    } else if (choice == Icons.content_cut) {
      return 'Scissors';
    }
    return '';
  }
}
