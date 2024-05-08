import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flip Flop Game',

      home: FlipFlopGame(),
    );
  }
}

class FlipFlopGame extends StatefulWidget {
  @override
  _FlipFlopGameState createState() => _FlipFlopGameState();
}

class _FlipFlopGameState extends State<FlipFlopGame> {
  List<String> letters = List.generate(26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));
  List<String> shuffledLetters = [];
  List<bool> flipped = [];

  int? firstSelectedIndex;
  int? secondSelectedIndex;

  Map<String, String> morseCodeMap = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.', 'G': '--.', 'H': '....',
    'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---', 'P': '.--.',
    'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
    'Y': '-.--', 'Z': '--..'
  };

  @override
  void initState() {
    super.initState();
    shuffledLetters.addAll(letters);
    shuffledLetters.addAll(letters);
    shuffledLetters.shuffle();
    flipped = List.generate(52, (index) => false);
  }

  void selectBox(int index) {
    setState(() {
      if (!flipped[index]) {
        if (firstSelectedIndex == null) {
          firstSelectedIndex = index;
        } else if (secondSelectedIndex == null) {
          secondSelectedIndex = index;
          if (shuffledLetters[firstSelectedIndex!] == shuffledLetters[secondSelectedIndex!]) {
            _showWinDialog();
          } else {
            _showLoseDialog();
          }
        }
        flipped[index] = true;
      }
    });
  }

  void _resetSelectedIndexes() {
    setState(() {
      firstSelectedIndex = null;
      secondSelectedIndex = null;
    });
  }

  void _shuffleBoxes() {
    setState(() {
      shuffledLetters.shuffle();
      flipped = List.generate(52, (index) => false);
    });
  }

  String getMorseCode(String letter) {
    return morseCodeMap[letter] ?? '';
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Congratulations!'),
        backgroundColor: Color(0xff73f0ff),
        content: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Flipped Letters and Morse Code:',style: TextStyle(color: Color(
                0xff141864), fontWeight: FontWeight.bold,),),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(shuffledLetters[firstSelectedIndex!], style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Color(0xff141864))),
                    Text(getMorseCode(shuffledLetters[firstSelectedIndex!]), style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff141864))),
                  ],
                ),
                Column(
                  children: [
                    Text(shuffledLetters[secondSelectedIndex!], style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Color(0xff141864))),
                    Text(getMorseCode(shuffledLetters[secondSelectedIndex!]), style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff141864))),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _shuffleBoxes();
              _resetSelectedIndexes();
              Navigator.pop(context);
            },
            child: Text('Play Again',
            style: TextStyle(color: Color(0xff141864)),),
          ),
        ],
      ),
    );
  }

  void _showLoseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('You Lose',
          style: TextStyle(color: Color(0xff73f0ff)),),
        backgroundColor: Color(0xff080226),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Flipped Letters and Morse Code:',
              style: TextStyle(color: Color(0xff73f0ff)),),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(shuffledLetters[firstSelectedIndex!], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xff73f0ff))),
                    Text(getMorseCode(shuffledLetters[firstSelectedIndex!]), style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff73f0ff))),
                  ],
                ),
                Column(
                  children: [
                    Text(shuffledLetters[secondSelectedIndex!], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xff73f0ff))),
                    Text(getMorseCode(shuffledLetters[secondSelectedIndex!]), style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff73f0ff))),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _shuffleBoxes();
              _resetSelectedIndexes();
              Navigator.pop(context);
            },
            child: Text('Play Again',
              style: TextStyle(color: Color(0xff60efef)),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff080226),
      appBar: AppBar(
        title: Text('Flip Flop Game',
        style: TextStyle(color: Color(0xff170a36),fontSize: 25,fontWeight: FontWeight.bold, )),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30), // Adjust the value as needed
            child: Text(
              'Try Your Luck',
              style: TextStyle(
                color: Color(0xffe3def6),
                fontSize: 25,
                fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Expanded(

            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: shuffledLetters.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    selectBox(index);
                  },
                  child: Container(
                    color: Color(0xff86f8e3),
                    alignment: Alignment.center,
                    child: flipped[index]
                        ? Text(
                      '${shuffledLetters[index]}',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xff170a36)),
                    )
                        : null,
                  ),
                );
              },
            ),
          ),
          Container(
            color: Color(0xff13063b),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© Designed by Ankit',
                  style: TextStyle(color: Colors.white,fontSize: 20,),
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Text('More Projects'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
