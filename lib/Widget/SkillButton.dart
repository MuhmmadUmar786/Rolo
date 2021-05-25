import 'package:flutter/material.dart';

class SkillButton extends StatelessWidget {
  final String title;
  final bool isClicked;

  SkillButton(
      {
        this.title,
        this.isClicked,
      });
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color:  isClicked?  Colors.teal:Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 12,right: 12),
        child: Center(
          child:Text('$title',
            style: TextStyle(fontSize: 15,color:isClicked? Colors.white: Colors.black),),
        ),
      ),
    );
  }
}