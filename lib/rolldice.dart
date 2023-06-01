// ignore: file_names :
import 'package:flutter/material.dart';
import 'dart:math';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  String diceimg1 = 'assets/images/dice1.png';
  String diceimg2 = 'assets/images/dice1.png';
  int score = 0;
  int buttonpressedCount = 0;
  int turns = 10;
  void rolldice() {
    // storing the random numbers
    int randomNum1 = Random().nextInt(6) + 1;
    int randomNum2 = Random().nextInt(6) + 1;
    setState(() {
      // for random dice images
      diceimg1 = 'assets/images/dice$randomNum1.png';
      diceimg2 = 'assets/images/dice$randomNum2.png';
      // for scores
      if (diceimg1 == 'assets/images/dice6.png' &&
          diceimg2 == 'assets/images/dice6.png') {
        score += 10;
      } else if (diceimg1 == 'assets/images/dice1.png' &&
          diceimg2 == 'assets/images/dice1.png') {
        score += 10;
      }
      // for Button pressed Count
      buttonpressedCount++;
      // for turns left
      turns--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dice Roll',
        ),
        backgroundColor: const Color.fromARGB(255, 7, 3, 70),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/BackgroundImg.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Score : $score',
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Turns left : $turns',
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  diceimg1,
                  height: 120,
                  width: 120,
                ),
                Image.asset(
                  diceimg2,
                  height: 120,
                  width: 120,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 141, 16, 16),
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              //check or disable the roll dice button
              onPressed: buttonpressedCount == 10 ? null : rolldice,
              child: const Text(
                'Roll Dice',
                style: TextStyle(fontSize: 20),
              ),
            ),
            FloatingActionButton.small(
              backgroundColor: buttonpressedCount == 10
                  ? const Color.fromARGB(255, 141, 16, 16)
                  : Colors.transparent.withOpacity(0.10),
              // check and set  the values for enable or disable button
              onPressed: buttonpressedCount == 10
                  ? () {
                      setState(() {
                        buttonpressedCount = 0;
                        score = 0;
                        turns = 10;
                      });
                    }
                  : null,
              child: const Icon(
                Icons.restart_alt,
                size: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
