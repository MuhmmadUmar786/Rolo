import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:rolo/Screen/CreateAccount.dart';
// import 'package:flutter_signin_button/button_list.dart';
// import 'package:flutter_signin_button/button_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Color(0xff080404),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Image.asset('assets/rolo.png',height: 130,width: 130,fit: BoxFit.cover,),
            SizedBox(height: 270,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child:Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child:Text('Request an invite',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Color(0xff080404),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 0,),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
                  )),
            ),

            SizedBox(height: 50,),
            Image.asset('assets/rolo.png',height: 130,width: 130,fit: BoxFit.cover,),
            SizedBox(height: 120,),

            AppleAuthButton(
              // key: const ValueKey<String>(''),
              onPressed: () {},
              onLongPress: () {},
              text: 'Sign up with Apple',
              darkMode: false,
              rtl: false,
              style: AuthButtonStyle(
                buttonColor: Color(0xff080404),
                splashColor: Colors.grey.shade100,
                shadowColor: Colors.grey,
                borderColor: Colors.grey,
                borderRadius: 8.0,
                borderWidth: 1.0,
                elevation: 2.0,
                width: 324.0,
                height: 50.0,
                separator: 10.0,
                iconSize: 35.0,
                iconBackground: Colors.transparent,
                iconType: AuthIconType.outlined,
                buttonType: AuthButtonType.secondary,
                padding: const EdgeInsets.all(8.0),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.50,
                ),
                progressIndicatorColor: Colors.red,
                progressIndicatorValueColor: Colors.amber,
                progressIndicatorStrokeWidth: 2.0,
              ),
            ),
            SizedBox(height: 15,),
            GoogleAuthButton(
              // key: const ValueKey<String>(''),
              onPressed: () {},
              onLongPress: () {},
              text: 'Sign up with Google',
              darkMode: false,
              rtl: false,
              style: AuthButtonStyle(
                buttonColor: Colors.white,
                splashColor: Colors.grey.shade100,
                shadowColor: Colors.grey,
                // borderColor: Colors.red,
                borderRadius: 8.0,
                // borderWidth: 2.0,
                elevation: 2.0,
                width: 324.0,
                height: 50.0,
                separator: 10.0,
                iconSize: 35.0,
                iconBackground: Colors.transparent,
                iconType: AuthIconType.outlined,
                buttonType: AuthButtonType.secondary,
                padding: const EdgeInsets.all(8.0),
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.50,
                ),
                progressIndicatorColor: Colors.red,
                progressIndicatorValueColor: Colors.amber,
                progressIndicatorStrokeWidth: 2.0,
              ),
            ),
            SizedBox(height: 15,),
            FacebookAuthButton(
              // key: const ValueKey<String>(''),
              onPressed: () {},
              onLongPress: () {},
              text: 'Sign up with Facebook',
              darkMode: false,
              rtl: false,
              style: AuthButtonStyle(
                buttonColor: Colors.blueAccent,
                splashColor: Colors.grey.shade100,
                shadowColor: Colors.grey,
                // borderColor: Colors.red,
                borderRadius: 8.0,
                // borderWidth: 2.0,
                elevation: 2.0,
                width: 324.0,
                height: 50.0,
                separator: 10.0,
                iconSize: 35.0,
                iconBackground: Colors.transparent,
                iconType: AuthIconType.outlined,
                buttonType: AuthButtonType.secondary,
                padding: const EdgeInsets.all(8.0),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.50,
                ),
                progressIndicatorColor: Colors.red,
                progressIndicatorValueColor: Colors.amber,
                progressIndicatorStrokeWidth: 2.0,
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('OR',style: TextStyle(color: Colors.white),),
              ),
              Container(
                height: 1,
                width: 200,
                color: Colors.grey,

              )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(17.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccount()),
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
                    child:Text('Sign up with email',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
