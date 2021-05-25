import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rolo/Screen/AddSkillScreen.dart';
import 'package:rolo/Screen/SplashScreen.dart';
import 'package:rolo/Widget/LocationButton.dart';
import 'package:rolo/Widget/SkillButton.dart';
import 'package:rolo/Widget/SkillSpecifButton.dart';
import 'dart:io';

import 'AvailablityScreen.dart';



class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}
class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isSocial=false;
  bool isBasic=true;
  String dropdownValue = 'Available';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff080404) ,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title:  GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Text('Cancel',style: TextStyle(color: Colors.white),),
            )),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0,top: 14),
              child: Text('Done',style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(isBasic==false){
                        setState(() {
                          isBasic=true;
                          isSocial=false;
                        });
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        color: isBasic? Colors.grey[800] :Color(0xff160b08),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text('Basic Info',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(width: 2,),
                  GestureDetector(
                    onTap: (){
                      if(isSocial==false){
                        setState(() {
                          isSocial=true;
                          isBasic=false;
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
              SizedBox(height: 20,),
              isBasic?
                  Column(
                    children: [
                      Container(
                        // color: Colors.grey,
                        height:MediaQuery.of(context).size.height * 0.62,
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(6)),
                                      child:
                                      _image != null
                                          ? ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.file(
                                          _image,
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                          : Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(6)),
                                        width: 90,
                                        height: 90,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text('Change Profile Picture',
                                  style: TextStyle(color: Colors.white,fontSize: 19 ),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('First Name',style: TextStyle(color: Colors.white,fontSize: 19),),
                                Container(
                                  height: 40,
                                  width: 200,
                                  child: TextFormField(
                                      initialValue: "Alec",
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
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
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Last Name',style: TextStyle(color: Colors.white,fontSize: 19),),
                                Container(
                                  height: 40,
                                  width: 200,
                                  child: TextFormField(
                                      initialValue: "Favale",
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
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
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Username',style: TextStyle(color: Colors.white,fontSize: 19),),
                                Container(
                                  height: 40,
                                  width: 200,
                                  child: TextFormField(
                                      initialValue: "alecfavale",
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
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
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Location',style: TextStyle(color: Colors.white,fontSize: 19),),
                                Container(
                                  height: 40,
                                  width: 200,
                                  child: TextFormField(
                                      initialValue: "New York City",
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(

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
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Location',style: TextStyle(color: Colors.white,fontSize: 19),),
                                Container(
                                  height: 40,
                                  width: 200,
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: const Icon(Icons.arrow_downward),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.green),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue = newValue;
                                      });
                                    },
                                    items: <String>[
                                      'Available',
                                      'Soon',
                                      'Not Available',

                                    ]
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Skill',style: TextStyle(color: Colors.white,fontSize: 19),),
                                Container(
                                  height: 40,
                                  width: 200,
                                  child: TextFormField(
                                      initialValue: "Add a Skill",
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(

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
                              ],
                            ),

                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Settings',style: TextStyle(color: Colors.blue,fontSize: 18),)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SplashScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Logout',style: TextStyle(color: Colors.blue,fontSize: 18),)),
                        ),
                      ),
                    ] ,
                  ):
                  Container(
                    // color: Colors.grey,
                    height:MediaQuery.of(context).size.height * 0.75,
                    child: ListView(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Edit Social Links',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20),
                          child: Text('Personal Website',style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                          child: Container(
                            height: 40,
                            child: TextFormField(
                                initialValue: "justinabuzid.com",
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20),
                          child: Text('Instagram',style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                          child: Container(
                            height: 40,
                            child: TextFormField(
                                initialValue: "@ instagram",
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20),
                          child: Text('TikTok',style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                          child: Container(
                            height: 40,
                            child: TextFormField(
                                initialValue: "@ TikTok",
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20),
                          child: Text('LinkedIn',style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                          child: Container(
                            height: 40,
                            child: TextFormField(
                                initialValue: "Linkedin.com/",
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20),
                          child: Text('Vimeo',style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                          child: Container(
                            height: 40,
                            child: TextFormField(
                                initialValue: "Vimeo.com/",
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20),
                          child: Text('Spotify',style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                          child: Container(
                            height: 40,
                            child: TextFormField(
                                initialValue: "Spotify.com/",
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
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
                        ),
                      ],
                    ),
                  )


            ],
          ),
        ),
      ),
    );
  }
}



class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff080404) ,
      appBar: AppBar(
        backgroundColor:Color(0xff080404) ,
        elevation: 0,
        leading:  GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Icon(Icons.arrow_back,color: Colors.white,),
            )),
        title: Text('Settings',style: TextStyle(color: Colors.white),),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.notifications,color: Colors.white,size: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Notifications',style: TextStyle(color: Colors.white,fontSize: 18),),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.lock_outline_rounded,color: Colors.white,size: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Privacy',style: TextStyle(color: Colors.white,fontSize: 18),),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.account_circle,color: Colors.white,size: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Account',style: TextStyle(color: Colors.white,fontSize: 18),),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.help,color: Colors.white,size: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Help',style: TextStyle(color: Colors.white,fontSize: 18),),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.info_outline,color: Colors.white,size: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('About',style: TextStyle(color: Colors.white,fontSize: 18),),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
