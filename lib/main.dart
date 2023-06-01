import 'package:dice_roll_app/rolldice.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll the Dice',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const RollDice(),
      debugShowCheckedModeBanner: false,
    );
  }
}
