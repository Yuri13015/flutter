import 'package:flutter/material.dart';
import 'dart:math';

class PendulumPage extends StatefulWidget {
  @override
  _PendulumPageState createState() => _PendulumPageState();
}

class _PendulumPageState extends State<PendulumPage> {
  List<String> words = ['FLUTTER', 'DART', 'MOBILE', 'DEVELOPMENT'];
  String secretWord = '';
  List<String> guessedLetters = [];
  int attemptsLeft = 6;
  bool gameOver = false;
  bool gameWon = false;

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    setState(() {
      secretWord = _generateRandomWord();
      guessedLetters.clear();
      attemptsLeft = 6;
      gameOver = false;
      gameWon = false;
    });
  }

  String _generateRandomWord() {
    Random random = Random();
    int randomIndex = random.nextInt(words.length);
    return words[randomIndex];
  }

  void makeGuess(String letter) {
    if (!gameOver && !guessedLetters.contains(letter)) {
      setState(() {
        guessedLetters.add(letter);
        if (!secretWord.contains(letter)) {
          attemptsLeft--;
          if (attemptsLeft == 0) {
            gameOver = true;
          }
        }
        if (checkGameWon()) {
          gameWon = true;
          gameOver = true;
        }
      });
    }
  }

  bool checkGameWon() {
    for (int i = 0; i < secretWord.length; i++) {
      String letter = secretWord[i];
      if (!guessedLetters.contains(letter)) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu du Pendu'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Mot secret : ${_getMaskedWord()}',
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
          SizedBox(height: 20),
          Text(
            'Essais restants : $attemptsLeft',
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: List.generate(26, (index) {
              String letter = String.fromCharCode(index + 65);
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: guessedLetters.contains(letter)
                      ? secretWord.contains(letter)
                          ? Colors.green
                          : Colors.red
                      : null,
                ),
                onPressed: () => makeGuess(letter),
                child: Text(letter),
              );
            }),
          ),
          SizedBox(height: 20),
          if (gameOver)
            Column(
              children: [
                if (gameWon)
                  Text(
                    'Félicitations, vous avez gagné !',
                    style: TextStyle(fontSize: 24, color: Colors.green),
                  )
                else
                  Text(
                    'Dommage, vous avez perdu !',
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: resetGame,
                  child: Text('Rejouer'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  String _getMaskedWord() {
    String maskedWord = '';
    for (int i = 0; i < secretWord.length; i++) {
      String letter = secretWord[i];
      if (guessedLetters.contains(letter)) {
        maskedWord += letter;
      } else {
        maskedWord += '_';
      }
      maskedWord += ' ';
    }
    return maskedWord.trim();
  }
}