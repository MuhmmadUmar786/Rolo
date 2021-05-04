import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolo/Screen/LocationScreen.dart';
import 'package:rolo/Widget/SkillButton.dart';
import 'package:rolo/Widget/SkillSpecifButton.dart';

import 'HomeScreen.dart';

class AddSkillScreen extends StatefulWidget {
  @override
  _AddSkillScreenState createState() => _AddSkillScreenState();
}

class _AddSkillScreenState extends State<AddSkillScreen> {
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
        title: Text('Skills',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
              SizedBox(height: 20,),
              Text('What are your creative skills?',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        labelText: 'Search creative occupations',
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
              SizedBox(height: 20,),
              Text('Don\'t have any? Add a custom occupation',
                style: TextStyle(color: Colors.white,),),

              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Suggested Skills',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SkillButton(title: 'Graphic Designer'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Video editor'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Illustrator'),
                  ],
                ),
              ),
              SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SkillButton(title: 'Model'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Photographer'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Art Director'),
                  ],
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SkillButton(title: 'Videographer'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Animator'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'VFX Artist'),
                  ],
                ),
              ),
              SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SkillButton(title: 'Songwriter'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Music Producer'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Actor'),
                  ],
                ),
              ),
              SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SkillButton(title: 'UI / UX Designer'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Creative Director'),
                  ],
                ),
              ),
              SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SkillButton(title: 'Dancer'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Art Director'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Photo Retoucher'),
                  ],
                ),
              ),
              SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SkillButton(title: 'Musician'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Colorist'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Make-Up Artist'),
                  ],
                ),
              ),
              SizedBox(height: 80,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhotoSkillScreen()),
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


class PhotoSkillScreen extends StatefulWidget {
  @override
  _PhotoSkillScreenState createState() => _PhotoSkillScreenState();
}

class _PhotoSkillScreenState extends State<PhotoSkillScreen> {

  bool portrait=false;
  bool wedding=false;
  bool product=false;
  bool landscape=false;
  bool event=false;
  bool travel=false;
  bool engagement=false;
  bool realstate=false;
  bool sport=false;
  bool other=false;


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
        title: Text('Skills',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
              SizedBox(height: 10,),
              Text('My photography focuses on',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 10,),
              Text('Select all that apply',
                style: TextStyle(color: Colors.white,),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(portrait==false){
                        setState(() {
                          portrait=true;
                        });
                      }
                      else{
                        setState(() {
                          portrait=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Portraits',
                        icon: Icon(Icons.account_box_outlined,color: Colors.white,size: 30,),
                      isActive: portrait,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(wedding==false){
                        setState(() {
                          wedding=true;
                        });
                      }
                      else{
                        setState(() {
                          wedding=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Wedding',
                        icon: Icon(Icons.dinner_dining,color: Colors.white,size: 30),
                        isActive: wedding,

                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(product==false){
                        setState(() {
                          product=true;
                        });
                      }
                      else{
                        setState(() {
                          product=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Product',
                        icon: FaIcon(FontAwesomeIcons.productHunt,color: Colors.white,size: 30,),
                        isActive: product,

                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(landscape==false){
                        setState(() {
                          landscape=true;
                        });
                      }
                      else{
                        setState(() {
                          landscape=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Landscape',
                        icon: Icon(Icons.landscape,color: Colors.white,size: 30),
                        isActive: landscape,

                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(event==false){
                        setState(() {
                          event=true;
                        });
                      }
                      else{
                        setState(() {
                          event=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Event',
                        icon: Icon(Icons.event,color: Colors.white,size: 30,),
                        isActive: event,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: GestureDetector(
                      onTap: (){
                        if(travel==false){
                          setState(() {
                            travel=true;
                          });
                        }
                        else{
                          setState(() {
                            travel=false;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SkillSpecificButton(title: 'Travel',
                          icon: Icon(Icons.flight_takeoff,color: Colors.white,size: 30),
                          isActive: travel,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(engagement==false){
                        setState(() {
                          engagement=true;
                        });
                      }
                      else{
                        setState(() {
                          engagement=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Engagement',
                        icon: FaIcon(FontAwesomeIcons.ring,color: Colors.white,size: 30,),
                        isActive: engagement,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(realstate==false){
                        setState(() {
                          realstate=true;
                        });
                      }
                      else{
                        setState(() {
                          realstate=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Real Estate',
                        icon: Icon(Icons.home_outlined,color: Colors.white,size: 30),
                        isActive: realstate,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(sport==false){
                        setState(() {
                          sport=true;
                        });
                      }
                      else{
                        setState(() {
                          sport=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Sport',
                        icon: Icon(Icons.sports_baseball,color: Colors.white,size: 30,),
                        isActive: sport,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(other==false){
                        setState(() {
                          other=true;
                        });
                      }
                      else{
                        setState(() {
                          other=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Other',
                        icon: Icon(Icons.auto_awesome_mosaic,color: Colors.white,size: 30),
                        isActive: other,
                      ),
                    ),
                  )
                ],
              ),


              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IllustrationSkillScreen()),
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


class IllustrationSkillScreen extends StatefulWidget {
  @override
  _IllustrationSkillScreenState createState() => _IllustrationSkillScreenState();
}

class _IllustrationSkillScreenState extends State<IllustrationSkillScreen> {
  bool realism=false;
  bool vector=false;
  bool cartoon=false;
  bool event=false;
  bool art=false;
  bool d3=false;
  bool design=false;
  bool sketch=false;
  bool other=false;
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
        title: Text('Skills',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
              SizedBox(height: 10,),
              Text('My illustrations focuses on',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
              ),
              SizedBox(height: 10,),
              Text('Select all that apply',
                style: TextStyle(color: Colors.white,),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(realism==false){
                        setState(() {
                          realism=true;
                        });
                      }
                      else{
                        setState(() {
                          realism=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Realism',
                        icon: FaIcon(FontAwesomeIcons.apple,color: Colors.white,size: 30,),
                      isActive:realism ,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(vector==false){
                        setState(() {
                          vector=true;
                        });
                      }
                      else{
                        setState(() {
                          vector=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Vector',
                        icon: FaIcon(FontAwesomeIcons.vectorSquare,color: Colors.white,size: 30),
                        isActive:vector ,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(cartoon==false){
                        setState(() {
                          cartoon=true;
                        });
                      }
                      else{
                        setState(() {
                          cartoon=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Cartoon/Comic',
                        icon: FaIcon(FontAwesomeIcons.snowman,color: Colors.white,size: 30,),
                        isActive:cartoon ,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(event==false){
                        setState(() {
                          event=true;
                        });
                      }
                      else{
                        setState(() {
                          event=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Event',
                        icon: Icon(Icons.event,color: Colors.white,size: 30,),
                        isActive:event ,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(art==false){
                        setState(() {
                          art=true;
                        });
                      }
                      else{
                        setState(() {
                          art=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Pixel Art',
                        icon: FaIcon(FontAwesomeIcons.artstation,color: Colors.white,size: 30,),
                        isActive:art ,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(d3==false){
                        setState(() {
                          d3=true;
                        });
                      }
                      else{
                        setState(() {
                          d3=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: '3D',
                        icon:FaIcon(FontAwesomeIcons.deviantart,color: Colors.white,size: 30),
                        isActive:d3 ,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(design==false){
                        setState(() {
                          design=true;
                        });
                      }
                      else{
                        setState(() {
                          design=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Character Design',
                        icon: FaIcon(FontAwesomeIcons.sketch,color: Colors.white,size: 30,),
                        isActive:design ,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(sketch==false){
                        setState(() {
                          sketch=true;
                        });
                      }
                      else{
                        setState(() {
                          sketch=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Sketching',
                        icon: Icon(Icons.design_services,color: Colors.white,size: 30),
                        isActive:sketch ,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 9,),
                  GestureDetector(
                    onTap: (){
                      if(other==false){
                        setState(() {
                          other=true;
                        });
                      }
                      else{
                        setState(() {
                          other=false;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SkillSpecificButton(title: 'Other',
                        icon: Icon(Icons.auto_awesome_mosaic,color: Colors.white,size: 30,),
                        isActive:other ,
                      ),
                    ),
                  ),

                ],
              ),


              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationScreen()),
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
