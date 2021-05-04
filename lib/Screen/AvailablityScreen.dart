

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolo/Screen/AddSkillScreen.dart';
import 'package:rolo/Widget/LocationButton.dart';
import 'package:rolo/Widget/SkillButton.dart';
import 'package:rolo/Widget/SkillSpecifButton.dart';

import 'DescrptionScreen.dart';



class AvailabilityScreen extends StatefulWidget {
  @override
  _AvailabilityScreenState createState() => _AvailabilityScreenState();
}
class _AvailabilityScreenState extends State<AvailabilityScreen> {

  bool isYes=false;
  bool isNo=false;
  bool isSoon=false;

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
        title: Text('Availability',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
              SizedBox(height: 30,),
              Text('Are you available for hire?',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

              SizedBox(height: 15,),
              Text('You can change this at any time',
                style: TextStyle(color: Colors.white,fontSize: 14),),
              SizedBox(height: 30,),

              GestureDetector(
                onTap: (){
                  if(isYes==false){
                    setState(() {
                      isYes=true;
                      isNo=false;
                      isSoon=false;
                    });
                  }
                  else{
                    setState(() {
                      isYes=false;
                    });
                  }

                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 44.0,right: 44),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isYes? Colors.green:Color(0xff080404),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child:Text('Yes',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  if(isSoon==false){
                    setState(() {
                      isYes=false;
                      isNo=false;
                      isSoon=true;
                    });
                  }
                  else{
                    setState(() {
                      isSoon=false;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 44.0,right: 44),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isSoon? Colors.green:Color(0xff080404),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child:Text('Soon',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  if(isNo==false){
                    setState(() {
                      isYes=false;
                      isNo=true;
                      isSoon=false;
                    });
                  }
                  else{
                    setState(() {
                      isNo=false;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 44.0,right: 44),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isNo? Colors.green:Color(0xff080404),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child:Text('No',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 230,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DescriptionScreen()),
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
