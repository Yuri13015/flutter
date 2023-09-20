import 'package:flutter/material.dart';
import 'dart:math';

enum Choice { rock, paper, scissors }

class RockPaperScissorsPage extends StatefulWidget {
  @override
  _RockPaperScissorsPageState createState() => _RockPaperScissorsPageState();
}

class _RockPaperScissorsPageState extends State<RockPaperScissorsPage> {
  late Choice playerChoice;
  late Choice computerChoice;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pierre-Feuille-Ciseaux'),
                backgroundColor: Colors.black,

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choisissez votre coup :',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => play(Choice.rock),
                    child: Image.asset(
                      'assets/images/rock.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => play(Choice.paper),
                    child: Image.asset(
                      'assets/images/paper.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => play(Choice.scissors),
                    child: Image.asset(
                      'assets/images/scissors.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (result.isNotEmpty)
              Text(
                result,
                style: TextStyle(fontSize: 24),
              ),
            if (result.isNotEmpty)
              Text(
                'L\'ordinateur a choisi : ${_choiceToString(computerChoice)}',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }

  void play(Choice playerChoice) {
    setState(() {
      this.playerChoice = playerChoice;
      this.computerChoice = _generateComputerChoice();
      this.result = _getResult();
    });
  }

  Choice _generateComputerChoice() {
    Random random = Random();
    int randomIndex = random.nextInt(3);
    return Choice.values[randomIndex];
  }

  String _getResult() {
    if (playerChoice == computerChoice) {
      return 'Égalité !';
    } else if ((playerChoice == Choice.rock && computerChoice == Choice.scissors) ||
        (playerChoice == Choice.paper && computerChoice == Choice.rock) ||
        (playerChoice == Choice.scissors && computerChoice == Choice.paper)) {
      return 'Vous avez gagné !';
    } else {
      return 'Vous avez perdu !';
    }
  }

  String _choiceToString(Choice choice) {
    switch (choice) {
      case Choice.rock:
        return 'Pierre';
      case Choice.paper:
        return 'Feuille';
      case Choice.scissors:
        return 'Ciseaux';
    }
  }
}