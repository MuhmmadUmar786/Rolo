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

  bool newyork=false;
  bool los=false;
  bool chicago=false;
  bool miami=false;
  bool diago=false;
  bool francisco=false;
  bool atlanta=false;
  bool houston=false;
  bool boston=false;
  bool phoenix=false;
  bool seattle=false;
  bool denver=false;
  bool nash=false;
  bool vegas=false;
  bool jack=false;


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
              SizedBox(height: 30,),
              Text('Where are you based?',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

              SizedBox(height: 30,),
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
              SizedBox(height: 40,),
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
                    GestureDetector(
                        onTap: (){
                          if(newyork==false){
                            setState(() {
                              newyork=true;
                            });
                          }
                          else{
                            setState(() {
                              newyork=false;
                            });
                          }
                        },
                        child: LocationlButton(title: 'New York City',isClicked: newyork,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(los==false){
                            setState(() {
                              los=true;
                            });
                          }
                          else{
                            setState(() {
                              los=false;
                            });
                          }
                        },
                        child: LocationlButton(title: 'Los Angeles',isClicked: los,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(chicago==false){
                            setState(() {
                              chicago=true;
                            });
                          }
                          else{
                            setState(() {
                              chicago=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'Chicago',isClicked: chicago,)),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          if(miami==false){
                            setState(() {
                              miami=true;
                            });
                          }
                          else{
                            setState(() {
                              miami=false;
                            });
                          }
                        },
                        child: LocationlButton(title: 'Miami',isClicked: miami,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(diago==false){
                            setState(() {
                              diago=true;
                            });
                          }
                          else{
                            setState(() {
                              diago=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'San Diego',isClicked: diago,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(francisco==false){
                            setState(() {
                              francisco=true;
                            });
                          }
                          else{
                            setState(() {
                              francisco=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'San Fancisco',isClicked: francisco,)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          if(atlanta==false){
                            setState(() {
                              atlanta=true;
                            });
                          }
                          else{
                            setState(() {
                              atlanta=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'Atlanta',isClicked: atlanta,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(houston==false){
                            setState(() {
                              houston=true;
                            });
                          }
                          else{
                            setState(() {
                              houston=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'Houston',isClicked: houston,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(boston==false){
                            setState(() {
                              boston=true;
                            });
                          }
                          else{
                            setState(() {
                              boston=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'Boston',isClicked: boston,)),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          if(phoenix==false){
                            setState(() {
                              phoenix=true;
                            });
                          }
                          else{
                            setState(() {
                              phoenix=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'Phoenix',isClicked: phoenix,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(seattle==false){
                            setState(() {
                              seattle=true;
                            });
                          }
                          else{
                            setState(() {
                              seattle=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'Seattle',isClicked: seattle,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(denver==false){
                            setState(() {
                              denver=true;
                            });
                          }
                          else{
                            setState(() {
                              denver=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'Denver',isClicked: denver,)),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          if(nash==false){
                            setState(() {
                              nash=true;
                            });
                          }
                          else{
                            setState(() {
                              nash=false;
                            });
                          }
                        },
                        child: LocationlButton(title: 'Nashville',isClicked: nash,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(vegas==false){
                            setState(() {
                              vegas=true;
                            });
                          }
                          else{
                            setState(() {
                              vegas=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'Las Vegas',isClicked: vegas,)),
                    SizedBox(width: 3,),
                    GestureDetector(
                        onTap: (){
                          if(jack==false){
                            setState(() {
                              jack=true;
                            });
                          }
                          else{
                            setState(() {
                              jack=false;
                            });
                          }
                        },
                        child : LocationlButton(title: 'Jacksonville',isClicked: jack,)),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.24,),

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
