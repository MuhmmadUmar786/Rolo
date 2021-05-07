import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'LinksScreen.dart';

class InvitationScreen extends StatefulWidget {
  @override
  _InvitationScreenState createState() => _InvitationScreenState();
}
class _InvitationScreenState extends State<InvitationScreen> {

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
        title: Text('Invite',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

      ),
      body: Container(
        color: Color(0xff080404),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 170,),
              Text('R O L O',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),

              SizedBox(height: 25,),
              Text('Who\'s a great potential addition to ROLO?\n'
                  'Refer your friends by entering their email\n'
                  'below',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 15),),
              SizedBox(height: 30,),
              Center(
                child:  Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24),
                  child: Container(
                    height: 45,
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: 'Enter Email',
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
              ),
              SizedBox(height: 180,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Toast.show("Invitation Sent", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

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
                      child:Text('Send Invite',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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
