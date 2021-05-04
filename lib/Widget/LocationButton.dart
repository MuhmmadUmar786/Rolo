import 'package:flutter/material.dart';

class LocationlButton extends StatelessWidget {
  final String title;
  LocationlButton(
      {
        this.title,
      });
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:Text('$title',
            style: TextStyle(fontSize: 14,color: Colors.black),),
        ),
      ),
    );
  }
}