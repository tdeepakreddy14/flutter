import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {

var activeDiceImage = 'images/dice-images/dice-1.png';
  void rollDice() {
    var diceNum = Random().nextInt(6) +1;
    setState(() {
    activeDiceImage = 'images/dice-images/dice-$diceNum.png';
    });
  }

  @override
  Widget build(context){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(activeDiceImage, width: 200),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                //padding: const EdgeInsets.only(top: 30),
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 29),
              ),
              child: const Text('roll dice'),
            ),
          ],
        );
  }
}
