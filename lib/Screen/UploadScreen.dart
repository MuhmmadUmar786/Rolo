import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rolo/Screen/HomeScreen.dart';
import 'package:rolo/Screen/InboxScreen.dart';
import 'package:rolo/Screen/RolodexScreen.dart';
import 'JobScreen.dart';
import 'ProfileScreen.dart';
import 'dart:io';

class UploadScreen extends StatefulWidget
{
  @override
  _UploadScreenState createState() => _UploadScreenState();
}
class _UploadScreenState extends State<UploadScreen> with TickerProviderStateMixin{
  int _selectedIndex = 2;
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
    else   if(index==4){
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
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
  }

  File _image;
  final picker = ImagePicker();

  Future _imgFromCamera() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _imgFromGallery() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    CardController controller;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff080404) ,
        automaticallyImplyLeading: false,
        title: Text('Uploads',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          GestureDetector(
            onTap: (){
              Alert(
                context: context,
                type: AlertType.info,
                title: "Upload Your File",
                desc: "Upload documents to a Portfolio",
                buttons: [
                  DialogButton(

                    child: Text(
                      "Browse Files",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      _showPicker(context);
                    },
                    width: 120,
                  )
                ],
              ).show();

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add,color: Colors.white,size: 35,),
            ),
          )
        ],
      ),

      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color(0xff080404),
          appBar: TabBar(
            labelStyle: TextStyle(),
            tabs: [
              Tab(text: 'Videography',),
              Tab(text: 'Photography',),
              Tab(text: 'Illustration',),
              Tab(text: 'UI Design',),
            ],
          ),
          body: TabBarView(
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.grey,
                        height:MediaQuery.of(context).size.height * 0.28,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Collections',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                            Container(
                              // color: Colors.white,
                              height:MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width*0.95,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/sea.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/shore.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/ocean.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),


                                ],
                              ),

                            )
                          ],
                        ),

                      ),
                      SizedBox(height: 0,),
                      Container(
                        // color: Colors.white,
                        height:MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Uploads',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/sea.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/ocean.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/shore.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/shore.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/sea.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/ocean.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
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
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.grey,
                        height:MediaQuery.of(context).size.height * 0.28,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Collections',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                            Container(
                              // color: Colors.white,
                              height:MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width*0.95,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/sea.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/shore.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/ocean.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),


                                ],
                              ),

                            )
                          ],
                        ),

                      ),
                      SizedBox(height: 0,),
                      Container(
                        // color: Colors.white,
                        height:MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Uploads',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Hero(
                                      tag: 'sea',
                                      child: Image.asset('assets/sea.jpeg',height: 114,width: 114,fit: BoxFit.cover,)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Hero(
                                      tag: 'ocean',
                                      child: Image.asset('assets/ocean.jpeg',height: 114,width: 114,fit: BoxFit.cover,)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/shore.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/shore.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/sea.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/ocean.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
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
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.grey,
                        height:MediaQuery.of(context).size.height * 0.28,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Collections',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                            Container(
                              // color: Colors.white,
                              height:MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width*0.95,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/sea.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/shore.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/ocean.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),


                                ],
                              ),

                            )
                          ],
                        ),

                      ),
                      SizedBox(height: 0,),
                      Container(
                        // color: Colors.white,
                        height:MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Uploads',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/sea.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/ocean.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/shore.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/shore.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/sea.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/ocean.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
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
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.grey,
                        height:MediaQuery.of(context).size.height * 0.28,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Collections',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                            Container(
                              // color: Colors.white,
                              height:MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width*0.95,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/sea.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/shore.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width*0.82,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          child: Image.asset('assets/ocean.jpeg',fit: BoxFit.cover,)),

                                    ),
                                  ),


                                ],
                              ),

                            )
                          ],
                        ),

                      ),
                      SizedBox(height: 0,),
                      Container(
                        // color: Colors.white,
                        height:MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Uploads',
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/sea.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/ocean.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/shore.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/shore.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/sea.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset('assets/ocean.jpeg',height: 114,width: 114,fit: BoxFit.cover,),
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
