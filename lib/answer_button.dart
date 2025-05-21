import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  //const AnswerButton(this.answer,this.onTap,{super.key});
  const AnswerButton({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        backgroundColor: Color.fromARGB(255, 34, 11, 103),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(answer,textAlign: TextAlign.center,),
    );
  }
}
