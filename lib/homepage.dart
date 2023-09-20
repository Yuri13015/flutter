import 'package:flutter/material.dart';
import 'tictactoe.dart';
import 'pendule.dart';
import 'rockpaperscissors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black, // Couleur de fond sombre
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Multi Jeu',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent, // Couleur néon du texte
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicTacToePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent, // Couleur néon du bouton
                  elevation: 5, // Ombre du bouton
                ),
                child: Text(
                  'Tic-Tac-Toe',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Couleur du texte
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PendulumPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // Couleur néon du bouton
                  elevation: 5, // Ombre du bouton
                ),
                child: Text(
                  'Jeu du Pendu',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Couleur du texte
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RockPaperScissorsPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent, // Couleur néon du bouton
                  elevation: 5, // Ombre du bouton
                ),
                child: Text(
                  'Pierre-Papier-Ciseaux',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Couleur du texte
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}