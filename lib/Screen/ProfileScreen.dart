import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolo/Screen/EditProfileScreen.dart';
import 'package:rolo/Screen/HomeScreen.dart';
import 'package:rolo/Screen/InboxScreen.dart';
import 'package:rolo/Screen/JobScreen.dart';
import 'package:rolo/Screen/UploadScreen.dart';
import 'package:rolo/Widget/SkillSpecifButton.dart';
import 'package:share/share.dart';

import 'InvitationScreen.dart';
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
          MaterialPageRoute(builder: (context) => InboxScreen()),
        );
      });
    }
    else  if(index==2){
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UploadScreen()),
        );
      });
    }
  }

  double _value=50;

  @override
  Widget build(BuildContext context) {
    CardController controller;
    return Scaffold(

      appBar: AppBar(
        backgroundColor:Color(0xff080404) ,
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(top: 16.0,left: 12),
          child: Text('Profile',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        ),
        title:GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InvitationScreen()),
              );
            },
            child: Icon(Icons.group_add_outlined,color: Colors.white,)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0,top: 10,bottom: 14),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              child: Container(
                height: 25,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Center(
                  child: Text('EDIT PROFILE',style: TextStyle(color: Colors.white),),
                ),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      child: Image.asset('assets/alex.jpg',
                                        height: MediaQuery.of(context).size.height * 0.1,
                                        width:MediaQuery.of(context).size.width * 0.24,
                                        fit: BoxFit.cover,)),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.12,
                                  width:MediaQuery.of(context).size.width * 0.45,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text('KEVIN MCGOVERN',
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                      Text('@kevinmcgovern',
                                        style: TextStyle(color: Colors.black,fontSize: 17),),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_rounded,color: Colors.black,),
                                          Text('New York',
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                                        ],
                                      ),
                                      Container(
                                        color: Colors.red,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text('NOT AVAILABLE FOR HIRE',
                                            style: TextStyle(fontSize: 12,color: Colors.white),),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,top: 6),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.035,
                                  width:MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Center(
                                      child: Text('Cinemato Grapher',
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(width: 17,),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          width:MediaQuery.of(context).size.width * 0.13,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(Icons.done,color: Colors.white,),
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
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),

              Container(
                // color: Colors.white,
                height:MediaQuery.of(context).size.height * 0.12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text('Profile Strength:',style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Icon(Icons.info_outline,color: Colors.white,),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: Container(
                        height:MediaQuery.of(context).size.height * 0.03,
                        child: Row(
                          children: [
                            Container(
                              height: 10,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                              ),
                            ),
                            SizedBox(width: 2,),

                            Container(
                              height: 10,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(width: 2,),

                            Container(
                              height: 10,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                              ),
                            ),
                            SizedBox(width: 2,),

                            Container(
                              height: 10,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(width: 2,),
                            Container(
                              height: 10,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                              ),
                            ),
                            SizedBox(width: 2,),
                            Container(
                              height: 10,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0,right: 12,top: 5),
                      child: Text('Having a strong profile is a great way to get recognized and increase your position in search results.',
                      style: TextStyle(fontSize: 14,color: Colors.white),
                      ),
                    )
                  ],
                ),

              ),
              SizedBox(height: 12,),
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
                  height:MediaQuery.of(context).size.height * 0.35,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0,left: 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.035,
                          width:MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: Text('Cinemato Grapher',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height:MediaQuery.of(context).size.height * 0.3,

                      child: DefaultTabController(
                        length: 3,
                        child: Scaffold(
                          backgroundColor:Color(0xff080404) ,
                          appBar: TabBar(
                            tabs: [
                              Tab(text: 'All',),
                              Tab(text: 'Television',),
                              Tab(text: 'Film',),
                            ],
                          ),
                          body: TabBarView(
                            children: [
                              Container(
                                height:MediaQuery.of(context).size.height * 0.23,
                                child: ListView(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/sea.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/ocean.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/shore.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/shore.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/sea.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/ocean.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/sea.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/ocean.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/shore.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                height:MediaQuery.of(context).size.height * 0.23,
                                child: ListView(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/sea.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/ocean.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/shore.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/shore.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/sea.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/ocean.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/sea.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/ocean.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/shore.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                height:MediaQuery.of(context).size.height * 0.23,
                                child: ListView(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/sea.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/ocean.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/shore.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/shore.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/sea.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/ocean.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/sea.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/ocean.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Image.asset('assets/shore.jpeg',
                                            height: MediaQuery.of(context).size.height * 0.15,
                                            width: MediaQuery.of(context).size.width * 0.32,
                                            fit: BoxFit.cover,),
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
                    )
                  ],
                ),

              ):
              Container(
                height:MediaQuery.of(context).size.height * 0.32,
                child: ListView(
                  children: [
                    SizedBox(height: 15,),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Icon(Icons.web,color: Colors.white,size: 35,),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Personal Website',
                             style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20),),
                         ),
                         Expanded(child: Container()),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                         )
                       ],
                     ),
                   ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfileScreen()),
                        );
                      },
                      child : Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add,size: 35,color: Colors.white,),
                        ),
                      ),
                    )

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
            icon: Icon(Icons.messenger_outline_outlined),
            label: 'Inbox',
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
