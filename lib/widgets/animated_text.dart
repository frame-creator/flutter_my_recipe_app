import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedText extends StatefulWidget {
  AnimatedText({Key key}) : super(key: key);
  

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child:  SizedBox(
      
      child: TyperAnimatedTextKit(
        //duration: Duration(milliseconds: 2000),
        //totalRepeatCount: 4,
        pause: Duration(milliseconds:  2000),
        text: [
          "You are WHAT YOU EAT",
          "당신이 무엇을 먹었는지 말해주세요.",
          "당신이 어떤 사람인지 알려줄께요.",
          "- 사바랭, [미식예찬], 1825 -",
          "당신의 식사가 당신이 된다.",
          "You are WHAT YOU EAT",
        ],
        displayFullTextOnTap: true,
         stopPauseOnTap: true,
         isRepeatingAnimation: false,
         //totalRepeatCount: 4,
        textStyle: TextStyle(fontSize: 38.0, color: Colors.white),
      ),
    ),
    );
  }
}