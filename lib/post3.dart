import 'package:flutter/material.dart';

class Post3 extends StatefulWidget {
  @override
  _Post3State createState() => _Post3State();
}

class _Post3State extends State<Post3> {
  TextEditingController _textEditingController = TextEditingController();
  String _convertedText = '';
  String _morseRepresentation = '';
  final Map<String, String> morseCode = {
    // English
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.', 'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
    'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
    'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-', 'Y': '-.--', 'Z': '--..',
    '1': '.----', '2': '..---', '3': '...--', '4': '....-', '5': '.....', '6': '-....', '7': '--...', '8': '---..', '9': '----.', '0': '-----',
    '.': '.-.-.-', ',': '--..--', '?': '..--..', '\'': '.----.', '!': '-.-.--', '/': '-..-.', '(': '-.--.', ')': '-.--.-', '&': '.-...', ':': '---...',
    ';': '-.-.-.', '=': '-...-', '+': '.-.-.', '-': '-....-', '_': '..--.-', '\"': '.-..-.', " ": '...-..-', '@': '.--.-.',

    // Hindi
    'अ': '.-', 'आ': '.-.-', 'इ': '..-', 'ई': '..-..', 'उ': '.--', 'ऊ': '.-..-', 'ए': '-.', 'ऐ': '-.--', 'ओ': '---', 'औ': '.--.',
    'क': '-.-', 'ख': '-..-', 'ग': '--.', 'घ': '--.-', 'च': '---', 'छ': '---.', 'ज': '.---', 'झ': '.----', 'ञ': '.--.-', 'ट': '..-',
    'ठ': '..--', 'ड': '.-.', 'ढ': '.-.-', 'ण': '.--.', 'त': '-', 'थ': '--', 'द': '-..', 'ध': '-...', 'न': '..', 'प': '....',
    'फ': '...-', 'ब': '...-', 'भ': '...--', 'म': '--..', 'य': '-.--', 'र': '.-.-', 'ल': '-.-.', 'व': '--..-', 'श': '----',
    'ष': '--...', 'स': '...', 'ह': '..-.', 'क़': '...-.', 'ख़': '---.', 'ग़': '-.--.', 'ज़': '-..-', 'फ़': '-.-..', 'ड़': '.-.--',
    'ढ़': '.-.--.', 'य़': '.--..', 'ः': '.-..-', 'ऽ': '.-.-.', '।': '.-..-',
    'ा': '.-',
  'ि': '..-', 'ी': '..-..', 'ु': '.--', 'ू': '.-..-', 'े': '-.', 'ै': '-.--', 'ो': '---', 'ौ': '.--.', 'ं': '.-...', 'ृ': '.--.-',
  'ँ': '..--.', 'ॅ': '.--.-', '़': '.----', '्': '.-.-',
    // Bengali
    'অ': '.-', 'আ': '.-.-', 'ই': '..-', 'ঈ': '..-..', 'উ': '.--', 'ঊ': '.-..-', 'ঋ': '.--.-', 'এ': '-.', 'ঐ': '-.--', 'ও': '---',
    'ঔ': '.--.', 'ক': '-.-', 'খ': '-..-', 'গ': '--.', 'ঘ': '--.-', 'ঙ': '-.--.', 'চ': '---', 'ছ': '---.', 'জ': '.---', 'ঝ': '.----',
    'ঞ': '-.--', 'ট': '..-', 'ঠ': '..--', 'ড': '.-.', 'ঢ': '.-.-', 'ণ': '.--.', 'ত': '-', 'থ': '--', 'দ': '-..', 'ধ': '-...',
    'ন': '..', 'প': '....', 'ফ': '...-', 'ব': '...-', 'ভ': '...--', 'ম': '--..', 'য': '-.--', 'র': '.-.-', 'ল': '-.-.', 'শ': '----',
    'ষ': '--...', 'স': '...', 'হ': '..-.', 'ড়': '.-.--', 'ঢ়': '.-.--.', 'য়': '.--..', 'ৎ': '-.-.-', 'ং': '.-...', 'ঃ': '.-..-',
    'ঁ': '..--.', 'ঽ': '.-.-.', '্': '.-.-',
    'া': '·—',
    'ি': '··—',
    'ী': '···—',
    'ু': '··—',
    'ূ': '···—',
    'ৃ': '·——',
    'ে': '·——',
    'ৈ': '·———',
    '◌̣':'__._',
    'ো': '——·',
    'ৌ': '———·',
    '্য': '—·———',
    '◌̇':"_._",
    '্র': '—·—·',
    '্ল': '—·——·',
    '্ক': '—·—·',
    '্খ': '—·—··',
    '্গ': '—·——·',
    '্ঘ': '—·———',
    '্ঙ': '—·—·—',
    '্চ': '—·—··',
    '্ছ': '—·—·—',
    '্জ': '—·———',
    '্ঝ': '—·——·',
    '্ঞ': '—·—·——',
    '্ট': '—·—·—',
    '্ঠ': '—·—·——',
    '্ড': '—·——·',
    '্ঢ': '—·———',
    '্ণ': '—·—·——',
    '্ত': '—·—',
    '্থ': '—·—·——',
    '্দ': '—·—·',
    '্ধ': '—·—··—',
    '্ন': '—·—·',
    '্প': '—·—··',
    '্ফ': '—·—··—',
    '্ব': '—·——',
    '্ভ': '—·———',
    '্ম': '—·—',
    '্শ': '—·—·—',
    '্ষ': '—·—··—',
    '্স': '—····—',
    '্হ': '—·———',
    '§': '·—·—·——',
    '%': '—·—·—·—',
    '‘': '·—·—·—',
    '’': '·—·—·—',
    '“': '·—·—··—',
    '”': '·—·—··—',
    '£': '·—·—··—',
    '¥': '·—·——·',
    '€': '·——·—·',
    '©': '·—·——·',
    '®': '·—·—·—',
    '™': '·—··—·—',
"ୟ":"_.__",
    // Oriya
    'ଅ': '.-', 'ଆ': '.-.-', 'ଇ': '..-', 'ଈ': '..-..', 'ଉ': '.--', 'ଊ': '.-..-', 'ଋ': '.--.-', 'ଏ': '-.', 'ଐ': '-.--', 'ଓ': '---',
    'ଔ': '.--.', 'କ': '-.-', 'ଖ': '-..-', 'ଗ': '--.', 'ଘ': '--.-', 'ଙ': '-.--.', 'ଚ': '---', 'ଛ': '---.', 'ଜ': '.---', 'ଝ': '.----',
    'ଞ': '-.--', 'ଟ': '..-', 'ଠ': '..--', 'ଡ': '.-.', 'ଢ': '.-.-', 'ଣ': '.--.', 'ତ': '-', 'ଥ': '--', 'ଦ': '-..', 'ଧ': '-...',
    'ନ': '..', 'ପ': '....', 'ଫ': '...-', 'ବ': '...-', 'ଭ': '...--', 'ମ': '--..', 'ଯ': '-.--', 'ର': '.-.-', 'ଲ': '-.-.', 'ଶ': '----',
    'ଷ': '--...', 'ସ': '...', 'ହ': '..-.', 'ଡ଼': '.-.--', 'ଢ଼': '.-.--.', 'ଣ଼': '.--.-', 'ଃ': '.-..-', 'ଽ': '.-.-.',
    'ଁ': '..--.', '଼': '.----', '୍': '.-.-',
    'ା': '.-', 'ି': '..-', 'ୀ': '..-..', 'ୁ': '.--', 'ୂ': '.-..-', 'େ': '-.', 'ୈ': '-.--', 'ୋ': '---', 'ୌ': '.--.', 'ୃ': '.--.-',
    "Bijay":".-.-.-"
  };

  // Function to convert text to Morse code
  String textToMorse(String text) {
    String morse = '';
    for (int i = 0; i < text.length; i++) {
      String character = text[i].toUpperCase();
      if (morseCode.containsKey(character)) {
        String? morseValue = morseCode[character];
        if (morseValue != null) {
          morse += morseValue + ' '; // Concatenate with space character
        } else {
          // Handle the case where the Morse code is null
          morse += '[NULL MORSE CODE] ';
        }
      } else {
        // Handle the case where the character doesn't have a Morse code representation
        morse += '[NO MORSE CODE] ';
      }
    }
    return morse;
  }

  // Function to convert Morse code to text
  String morseToText(String morse) {
    String text = '';
    List<String> morseList = morse.split(' ');
    for (String code in morseList) {
      if (code.isNotEmpty) {
        String letter = morseCode.entries.firstWhere((entry) => entry.value == code, orElse: () => MapEntry('', '')).key;
        text += letter;
      }
    }
    return text;
  }

  // Function to update Morse representation as text changes
  void updateMorseRepresentation(String text) {
    String morseRepresentation = '';
    for (int i = 0; i < text.length; i++) {
      String character = text[i].toUpperCase();
      if (morseCode.containsKey(character)) {
        String? morseValue = morseCode[character];
        if (morseValue != null) {
          morseRepresentation += '$character: $morseValue\n'; // Add character and its Morse code representation
        } else {
          // Handle the case where the Morse code is null
          morseRepresentation += '$character: [NULL MORSE CODE]\n';
        }
      } else {
        // Handle the case where the character doesn't have a Morse code representation
        morseRepresentation += '$character: [NO MORSE CODE]\n';
      }
    }
    setState(() {
      _morseRepresentation = morseRepresentation;
    });
  }

  // Function to convert sentence to Morse code
  void convertSentenceToMorse(String sentence) {
    setState(() {
      _convertedText = textToMorse(sentence);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5.0),
        Container(
          margin: EdgeInsets.only(left: 70.0, right: 20.0, bottom: 15.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              TextField(
                controller: _textEditingController,
                onChanged: (text) {
                  updateMorseRepresentation(text);
                },
                decoration: InputDecoration(labelText: 'Enter Text or Morse Code'),
                style: TextStyle(color: Color(0xffeafffb), ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _convertedText = textToMorse(_textEditingController.text);
                  });
                },
                child: Text('Convert to Morse-Code'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _convertedText = morseToText(_textEditingController.text);
                  });
                },
                child: Text('Remove'),
              ),
              SizedBox(height: 20.0),

              Text(
                'Morse Representation:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffeafffb)),
              ),
              SizedBox(height: 10.0),
              Text(
                _morseRepresentation,
                style: TextStyle(fontSize: 22, color: Color(0xffeafffb)),
              ),
              SizedBox(height: 20.0),
              Text(
                'Converted Text:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(
                    0xffeafffb)),
              ),
              SizedBox(height: 10.0),
              Text(
                _convertedText,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.w900, color: Color(0xffd9e71b)),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
