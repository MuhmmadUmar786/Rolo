import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:on_boarding_ui/on_boarding_ui.dart';
import 'package:rolo/Screen/HomeScreen.dart';
import 'package:rolo/Screen/ProfileScreen.dart';
import 'package:on_boarding_ui/model/slider.dart' as SliderModel;
import 'RolodexScreen.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> with TickerProviderStateMixin{

  int _selectedIndex = 3;
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
    else   if(index==4){
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
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
        title:Text('Jobs',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

      ),

      body: Container(
        color:Color(0xff080404),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                color:Color(0xff080404),
                child: OnBoardingUi(

                    slides:[
                  SliderModel.Slider(
                    sliderHeading: "One Tap Apply",
                    sliderSubHeading: "Quickly apply to jobs with a simple tap of "
                        "a button. Rolo will pull all of your relevant "
                        "work",
                    sliderImageUrl: 'assets/one.png',
                  ),
                  SliderModel.Slider(
                    sliderHeading: "Opportunities with Big Brands",
                    sliderSubHeading: "From marketing agencies to top businesses, "
                        "you’ll have a chance to apply to gigs for all "
                        "types",
                    sliderImageUrl: 'assets/two.png',
                  ),
                  SliderModel.Slider(
                    sliderHeading: "Collaborate with the",
                    sliderSubHeading: "Seeking other local creatives to work with? "
                        "We’re making it easy & efficient to partner "
                        "with other users on getting projects off of the "
                        "ground.",
                    sliderImageUrl: 'assets/three.png',
                  ),
                      SliderModel.Slider(
                        sliderHeading: "Built-In Contracts & Payment",
                        sliderSubHeading: "We’re making it safe & secure to ensure "
                            "you get paid on time through a trustworthy payment system. "
                            "We will ensure you get paid for your hard work!",
                        sliderImageUrl: 'assets/four.png',
                      )
                ],onFinish: (){
                  // Your OnFinish code here
                }),
          ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 24.0,right: 24),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child:Text('Join Waitlist',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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
