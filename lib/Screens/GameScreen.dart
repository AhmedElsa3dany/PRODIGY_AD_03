import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xo/constants.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> _board = List.filled(9, '');
  String _currentPlayer = 'X';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor3,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kColor3,
        title: SafeArea(
          child: Text('Tic Tac Toe',
              style: GoogleFonts.dancingScript(
                textStyle: const TextStyle(
                  fontSize: 60,
                  color: kColor5,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Center(
          child: Column(
            //    mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _onTap(index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 6, 2, 118),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 250, 250, 250),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            _board[index],
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: _board[index] == 'X'
                                  ? const Color.fromARGB(255, 250, 5, 5)
                                  : kColor5,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  onPressed: _resetGame,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    backgroundColor: kColor4,
                    // foregroundColor: kColor1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'RESET',
                    style: GoogleFonts.cinzel(
                      textStyle: const TextStyle(
                        letterSpacing: 4,
                        fontSize: 40,
                        color: kColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      if (_board[index] == '') {
        _board[index] = _currentPlayer;
        if (_checkWinner(_currentPlayer)) {
          _showWinnerDialog(_currentPlayer);
        } else {
          _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
        }
      }
    });
  }

  bool _checkWinner(String player) {
    // تحقق من الصفوف والأعمدة والقطرين للفوز
    List<List<int>> winningPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var positions in winningPositions) {
      if (_board[positions[0]] == player &&
          _board[positions[1]] == player &&
          _board[positions[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void _showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'CONGRATEULATION',
          style: GoogleFonts.gabriela(
            textStyle: const TextStyle(
              letterSpacing: 2,
              fontSize: 23,
              color: Color.fromARGB(255, 252, 5, 5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Row(
          children: [
            Text(
              'Player',
              style: GoogleFonts.lumanosimo(
                textStyle: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 20,
                  color: kColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              ' $winner ',
              style: GoogleFonts.lumanosimo(
                textStyle: TextStyle(
                  letterSpacing: 2,
                  fontSize: 40,
                  color: winner == 'X'
                      ? const Color.fromARGB(255, 250, 5, 5) // Color for X
                      : kColor5, // Color for O
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Is Win',
              style: GoogleFonts.lumanosimo(
                textStyle: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 20,
                  color: kColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetGame();
            },
            child: Text(
              'OK',
              style: GoogleFonts.cinzel(
                textStyle: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 30,
                  color: Color.fromARGB(255, 6, 2, 118),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _resetGame() {
    setState(() {
      _board = List.filled(9, '');
      _currentPlayer = 'X';
    });
  }
}
