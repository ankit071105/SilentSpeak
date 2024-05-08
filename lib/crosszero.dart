import 'package:flutter/material.dart';

void main() {
  runApp(CrossZeroGame());
}

class CrossZeroGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cross Zero Game',
      home: GameBoard(),
    );
  }
}

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> board = List.generate(9, (index) => ' ');
  bool playerTurn = true; // true for player's turn, false for computer's turn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cross Zero Game',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0xff330d52),
      ),
      body: Container( // Add a container to set the background color
        color:  Color(0xff050636), // Set the background color to black
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                'Tic-Tac-Go',
                style: TextStyle(fontSize: 60, color: Colors.white), // Change text color to white
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Center(
                child: Text(
                  '· · · − · · · − · ·', // Morse code for "Add this to it"
                  style: TextStyle(fontSize: 45, color: Colors.white), // Change text color to white
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (playerTurn && board[index] == ' ') {
                        setState(() {
                          board[index] = 'X';
                          playerTurn = false;
                          checkWin();
                          if (!playerTurn) {
                            machineMove();
                          }
                        });
                        String morseCode = convertToMorseCode(index.toString());
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Morse code for $index is: $morseCode',
                              style: TextStyle(fontSize: 23, color: Color(0xffacf2ff)), // Increased font size
                            ),
                            backgroundColor:Color(0xff480480),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff1de8ee)),
                        color: Color(0xff8dfff5),
                      ),
                      child: Center(
                        child: Text(
                          board[index],
                          style: TextStyle(fontSize: 40, color: board[index] == 'X' ? Color(0xff8d0996) : Color(0xff1b6907)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

  }

  void checkWin() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] != ' ' && board[i] == board[i + 1] && board[i] == board[i + 2]) {
        showResultDialog(board[i]);
        return;
      }
    }
    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] != ' ' && board[i] == board[i + 3] && board[i] == board[i + 6]) {
        showResultDialog(board[i]);
        return;
      }
    }
    // Check diagonals
    if ((board[0] != ' ' && board[0] == board[4] && board[0] == board[8]) ||
        (board[2] != ' ' && board[2] == board[4] && board[2] == board[6])) {
      showResultDialog(board[4]);
      return;
    }
    // Check for draw
    if (!board.contains(' ')) {
      showResultDialog(null); // Draw
    }
  }

  void machineMove() {
    // Simple implementation for the machine's move: find the first empty cell and mark it with 'O'
    for (int i = 0; i < board.length; i++) {
      if (board[i] == ' ') {
        setState(() {
          board[i] = 'O';
          playerTurn = true;
          checkWin();
        });
        return;
      }
    }
  }

  void showResultDialog(String? winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff440a85),
          title: Text('Game Over', style: TextStyle(color: Colors.white)),
          content: winner != null
              ? Text('$winner wins!', style: TextStyle(color: Colors.white))
              : Text('It\'s a draw!', style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again', style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  board = List.generate(9, (index) => ' ');
                  playerTurn = true;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String convertToMorseCode(String text) {
    Map<String, String> morseCodeMap = {
      '0': '-----', '1': '.----', '2': '..---', '3': '...--', '4': '....-',
      '5': '.....', '6': '-....', '7': '--...', '8': '---..', '9': '----.',
    };
    List<String> morseCodes = [];
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      String? morseCode = morseCodeMap[char];
      if (morseCode != null) {
        morseCodes.add(morseCode);
      }
    }
    return morseCodes.join(' ');
  }
}
