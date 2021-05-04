import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolo/Screen/HomeScreen.dart';
import 'package:rolo/Screen/JobScreen.dart';
import 'package:rolo/Widget/SkillSpecifButton.dart';

import 'RolodexScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin{



 bool isSocial=false;
 bool isPortfolio=true;


  int _selectedIndex = 4;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(index==1){
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RolodexScreen()),
        );
      });
    }
    else   if(index==0){
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    }
    else   if(index==3){
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => JobScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CardController controller;
    return Scaffold(

      appBar: AppBar(
        backgroundColor:Color(0xff080404) ,
        automaticallyImplyLeading: false,
        title:Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0,top: 10,bottom: 14),
            child: Container(
              height: 25,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text('EDIT PROFILE',style: TextStyle(color: Colors.white),),
              ),
            ),
          )
        ],
      ),

      body: Container(
        color:Color(0xff080404),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // color: Colors.grey,
                  height:MediaQuery.of(context).size.height * 0.23,
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      child: Image.asset("assets/alex.jpg",height: 80,width:80,fit: BoxFit.cover,)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('KEVIN MCGOVERN',
                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('kevinmcgovern',
                                      style: TextStyle(color: Colors.black,fontSize: 18),),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_rounded,color: Colors.black,),
                                        Text('New York',
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                      ],
                                    ),
                                    Container(
                                      color: Colors.green,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('AVAILABLE FOR HIRE'),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('Graphic Designer',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Focused on the moodier tones often not used.",
                                    style: TextStyle(fontSize: 12),
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(Icons.add,color: Colors.white,),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(Icons.message,color: Colors.white,),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(Icons.send,color: Colors.white,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(isPortfolio==false){
                        setState(() {
                          isPortfolio=true;
                          isSocial=false;
                        });
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        color: isPortfolio? Colors.grey[800] :Color(0xff160b08),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text('Portfolios',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                   SizedBox(width: 2,),
                   GestureDetector(
                     onTap: (){
                       if(isSocial==false){
                         setState(() {
                           isSocial=true;
                           isPortfolio=false;
                         });
                       }
                     },
                     child: Container(
                      height: 30,
                       width: 150,
                       decoration: BoxDecoration(
                        color: isSocial? Colors.grey[800] :Color(0xff030607),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text('Social Links',style: TextStyle(color: Colors.white)),
                      ),
                  ),
                   ),

                ],
              ),
              SizedBox(height: 12,),
              isPortfolio?
              Container(
                // color: Colors.white,
                  height:MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/sea.jpeg',height: 110,width: 110,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/ocean.jpeg',height: 110,width: 110,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/shore.jpeg',height: 110,width: 110,fit: BoxFit.cover,),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/shore.jpeg',height: 110,width: 110,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/sea.jpeg',height: 110,width: 110,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/ocean.jpeg',height: 110,width: 110,fit: BoxFit.cover,),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/sea.jpeg',height: 110,width: 110,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/ocean.jpeg',height: 110,width: 110,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset('assets/shore.jpeg',height: 110,width: 110,fit: BoxFit.cover,),
                        ),

                      ],
                    ),
                  ],
                ),

              ):
              Container(
                height:MediaQuery.of(context).size.height * 0.5,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SkillSpecificButton(title: 'Instagram',
                            icon: FaIcon(FontAwesomeIcons.instagram,color: Colors.white,size: 30,),
                            isActive: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SkillSpecificButton(title: 'LinkedIn',
                            icon: FaIcon(FontAwesomeIcons.linkedin,color: Colors.white,size: 30),
                            isActive: false,

                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SkillSpecificButton(title: 'Tik Tok',
                            icon: FaIcon(FontAwesomeIcons.tiktok,color: Colors.white,size: 30,),
                            isActive: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SkillSpecificButton(title: 'Spotify',
                            icon: FaIcon(FontAwesomeIcons.spotify,color: Colors.white,size: 30),
                            isActive: false,

                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SkillSpecificButton(title: 'Youtube',
                            icon: FaIcon(FontAwesomeIcons.youtube,color: Colors.white,size: 30,),
                            isActive: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SkillSpecificButton(title: 'Vimeo',
                            icon: FaIcon(FontAwesomeIcons.vimeo,color: Colors.white,size: 30),
                            isActive: false,

                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SkillSpecificButton(title: 'Website',
                            icon: FaIcon(FontAwesomeIcons.firefoxBrowser,color: Colors.white,size: 30,),
                            isActive: false,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Rolodex',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        backgroundColor:Color(0xff080404) ,
        onTap: _onItemTapped,
      ),
    );
  }
}
