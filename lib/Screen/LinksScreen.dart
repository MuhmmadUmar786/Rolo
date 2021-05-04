

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolo/Screen/AddSkillScreen.dart';
import 'package:rolo/Screen/HomeScreen.dart';
import 'package:rolo/Widget/LocationButton.dart';
import 'package:rolo/Widget/SkillButton.dart';
import 'package:rolo/Widget/SkillSpecifButton.dart';



class LinksScreen extends StatefulWidget {
  @override
  _LinksScreenState createState() => _LinksScreenState();
}
class _LinksScreenState extends State<LinksScreen> {



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
        title: Text('Links',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 18),
            child: Text('Skip',style: TextStyle(color: Colors.white),),
          )
        ],

      ),
      body: Container(
        color: Color(0xff080404),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 15,),
              Text('You can always add later',
                style: TextStyle(color: Colors.white,fontSize: 14),),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Personal Website',
                        hintText: 'Website Url',
                        hintStyle:TextStyle(color: Colors.white),
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Instagram',
                        hintText: 'Instagram.com/',
                        hintStyle:TextStyle(color: Colors.white),
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Tik Tok',
                        hintText: 'Tiktok.com/',
                        hintStyle:TextStyle(color: Colors.white),
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Vimeo',
                        hintText: 'Vimeo.com/',
                        hintStyle:TextStyle(color: Colors.white),
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

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'LinkedIn',
                        hintText: 'LinkedIn.com/',
                        hintStyle:TextStyle(color: Colors.white),
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Spotify',
                        hintText: 'Spotify.com/',
                        hintStyle:TextStyle(color: Colors.white),
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Youtube',
                        hintText: 'Youtube.com/',
                        hintStyle:TextStyle(color: Colors.white),
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

              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
