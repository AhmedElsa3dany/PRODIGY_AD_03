import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xo/Screens/PlayerSelectionScreen.dart';
import 'package:xo/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tic Tac Toe',
                style: GoogleFonts.dancingScript(
                  textStyle: const TextStyle(
                    fontSize: 80,
                    color: Colors.blue,
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
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlayerSelectionScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: kColor4,
                // foregroundColor: kColor1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'START',
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
          ],
        ),
      ),
    );
  }
}
