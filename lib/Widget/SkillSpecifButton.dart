import 'package:flutter/material.dart';

class SkillSpecificButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool isActive;
  SkillSpecificButton(
      {
        this.title,
        this.icon,
        this.isActive
      });
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey[700] : Color(0xff080404),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$title',
                style: TextStyle(fontSize: 15,color: Colors.white),),
            ),

          ],
        ),
      ),
    );
  }
}