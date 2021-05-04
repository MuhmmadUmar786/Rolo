
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rolo/Screen/AddSkillScreen.dart';
import 'package:rolo/Screen/HomeScreen.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

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
        leading:  GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
            )),
        title: Text('Create Account',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(

                  style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'First name',
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
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(

                  style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Last name',
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
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(

                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Username',
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
              SizedBox(height: 60,),
              GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xffFDCF09),
                  child: _image != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      _image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text('Upload profile picture',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 80,),

              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateAccountSecond()),
                    );
                  },
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
            ],
          ),
        ),
      ),
    );
  }
}


class CreateAccountSecond extends StatefulWidget {
  @override
  _CreateAccountSecondState createState() => _CreateAccountSecondState();
}

class _CreateAccountSecondState extends State<CreateAccountSecond> {
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
        title: Text('Create Account',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Email address',
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
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Password',
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
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: TextField(
                  obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Confirm password',
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
              SizedBox(height: 280,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddSkillScreen()),
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

