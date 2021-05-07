import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:rolo/Screen/RolodexScreen.dart';
import 'package:rolo/Screen/UploadScreen.dart';
import 'package:rolo/Widget/SkillButton.dart';

import 'JobScreen.dart';
import 'ProfileScreen.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> with TickerProviderStateMixin{


  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
      IconButton(
        icon: const Icon(Icons.filter_list_sharp),
        onPressed: (){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilterMoreScreen()),
          );

        },
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }

  @override
  Widget build(BuildContext context) {
    CardController controller;
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xff080404) ,
        // appBar: AppBar(
        //   backgroundColor:Color(0xff080404) ,
        //   leading: _isSearching ? const BackButton() :
        //   GestureDetector(
        //       onTap: (){
        //         Navigator.pop(context);
        //       },
        //       child: Icon(Icons.arrow_back,color: Colors.white,))
        //   ,
        //   title: _isSearching ? _buildSearchField() :Text('Search',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        //   actions: _buildActions(),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 160,
                child: Stack(
                  children: [
                    Image.asset('assets/new.jpeg',height: 160,width: double.infinity,fit: BoxFit.cover,),
                    Positioned(
                        top: 24,
                        left: 12,
                        child  : Text('Search',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),)),
                     Positioned(
                        top: 24,
                        left: 312,
                        child  : GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => JobScreen()),
                              );
                            },
                            child: Icon(Icons.wallet_giftcard_sharp,color: Colors.white,size: 32,))),
                    Positioned(
                      top: 100,
                      left: 20,
                      child: Container(
                        height: 40,
                        width: 300,
                        child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Search by name or role',

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
                    )


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('What can we help you find?',
                style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5,),
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
              SizedBox(height: 10,),
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
              SizedBox(height: 10),
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
              SizedBox(height: 10,),
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
              SizedBox(height: 10,),
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
              SizedBox(height: 10,),
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
              SizedBox(height: 10,),
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SkillButton(title: 'Set Designer'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Director'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Photo Product Designer'),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    SkillButton(title: 'Cinematographer'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Hair Stylist'),
                    SizedBox(width: 3,),
                    SkillButton(title: 'Stylist'),
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


class FilterMoreScreen extends StatefulWidget {
  @override
  _FilterMoreScreenState createState() => _FilterMoreScreenState();
}

class _FilterMoreScreenState extends State<FilterMoreScreen> with TickerProviderStateMixin{

  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valuefour = false;
  bool valuefive = false;
  bool valuetsix = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff080404) ,
      appBar: AppBar(
        backgroundColor:Color(0xff080404) ,
        leading:
        GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.clear,color: Colors.white,))
        ,
        title: Text('Filter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:
          [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0,right: 24),
              child: Container(
                height: 40,
                child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Enter zip code',
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
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: CheckboxListTile(
                  checkColor: Colors.white,
                  // secondary: const Icon(Icons.alarm,color: Colors.white,),
                  title: const Text('Anywhere',style: TextStyle(color: Colors.white),),
                  value: this.valuefirst,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuefirst = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: CheckboxListTile(
                  checkColor: Colors.white,
                  // secondary: const Icon(Icons.alarm,color: Colors.white,),
                  title: const Text('New York City',style: TextStyle(color: Colors.white),),
                  value: this.valuesecond,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuesecond = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: CheckboxListTile(
                  checkColor: Colors.white,
                  // secondary: const Icon(Icons.alarm,color: Colors.white,),
                  title: const Text('Los Angeles',style: TextStyle(color: Colors.white),),
                  value: this.valuethird,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuethird = value;
                    });
                  },
                ),
              ),
            ),
            Divider(indent: 20,endIndent: 20,color: Colors.white,),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0,right: 24),
              child: Container(
                height: 40,
                child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Enter skill',
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
            SizedBox(height: 15,),
            Divider(indent: 20,endIndent: 20,color: Colors.white,),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Availability for Hire'
                  ,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: CheckboxListTile(
                  checkColor: Colors.white,
                  // secondary: const Icon(Icons.alarm,color: Colors.white,),
                  title: const Text('Available',style: TextStyle(color: Colors.white),),
                  value: this.valuefour,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuefour = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: CheckboxListTile(
                  checkColor: Colors.white,
                  // secondary: const Icon(Icons.alarm,color: Colors.white,),
                  title: const Text('Available Soon',style: TextStyle(color: Colors.white),),
                  value: this.valuefive,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuefive = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: CheckboxListTile(
                  checkColor: Colors.white,
                  // secondary: const Icon(Icons.alarm,color: Colors.white,),
                  title: const Text('Not Available',style: TextStyle(color: Colors.white),),
                  value: this.valuetsix,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuetsix = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
