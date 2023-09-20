import 'package:flutter/material.dart';

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
late List<List<String>> board;
  late String currentPlayer;
late bool gameOver;
late String winner;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    board = List<List<String>>.generate(3, (_) => List<String>.filled(3, ''));
    currentPlayer = 'X';
    gameOver = false;
    winner = '';
  }

  void makeMove(int row, int col) {
    if (board[row][col] == '' && !gameOver) {
      setState(() {
        board[row][col] = currentPlayer;
        if (checkWin(currentPlayer, row, col)) {
          gameOver = true;
          winner = currentPlayer;
        } else if (checkDraw()) {
          gameOver = true;
          winner = 'Draw';
        } else {
          currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
        }
      });
    }
  }

  bool checkWin(String player, int row, int col) {
    // Check row
    if (board[row][0] == player && board[row][1] == player && board[row][2] == player) {
      return true;
    }
    // Check column
    if (board[0][col] == player && board[1][col] == player && board[2][col] == player) {
      return true;
    }
    // Check diagonal
    if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
        (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
      return true;
    }
    return false;
  }

  bool checkDraw() {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col] == '') {
          return false;
        }
      }
    }
    return true;
  }

  void resetGame() {
    setState(() {
      startGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Current Player: $currentPlayer',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              final row = index ~/ 3;
              final col = index % 3;
              return GestureDetector(
                onTap: () => makeMove(row, col),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      board[row][col],
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          if (gameOver)
            Column(
              children: [
                Text(
                  (winner == 'Draw') ? 'It\'s a draw!' : 'Winner: $winner',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: resetGame,
                  child: Text('Play Again'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}