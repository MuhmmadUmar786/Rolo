import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolo/Screen/AddSkillScreen.dart';
import 'package:rolo/Widget/LocationButton.dart';
import 'package:rolo/Widget/SkillButton.dart';
import 'package:rolo/Widget/SkillSpecifButton.dart';

import 'AvailablityScreen.dart';



class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff080404) ,
        elevation: 0,
        leading:  GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
            )),
        title: Text('Location',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,


      ),
      body: Container(
        color: Color(0xff080404),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text('Where are you based?',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        labelText: 'Search cities',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white)
                        )
                    )
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Popular Cities',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    LocationlButton(title: 'New York City'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'Los Angeles'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'Chicago'),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    LocationlButton(title: 'Miami'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'San Diego'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'San Fancisco'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    LocationlButton(title: 'Atlanta'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'Houston'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'Boston'),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    LocationlButton(title: 'Phoenix'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'Seattle'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'Denver'),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    LocationlButton(title: 'Nashville'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'Las Vegas'),
                    SizedBox(width: 3,),
                    LocationlButton(title: 'Jacksonville'),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              SizedBox(height: 80,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AvailabilityScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child:Text('Next',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
