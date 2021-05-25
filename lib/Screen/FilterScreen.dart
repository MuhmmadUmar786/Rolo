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
                height: MediaQuery.of(context).size.height *0.23,
                child: Stack(
                  children: [
                    Image.asset('assets/new.jpeg',
                      height: MediaQuery.of(context).size.height *0.23,
                      width: double.infinity,fit: BoxFit.cover,),
                    Positioned(
                        top: 30,
                        left: 12,
                        child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,))),
                    Positioned(
                        top: 24,
                        left: 52,
                        child  : Text('Search',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),)),
                     Positioned(
                        top: 24,
                        left: 342,
                        child  : GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => JobScreen()),
                              );
                            },
                            child: Icon(Icons.wallet_giftcard_sharp,color: Colors.white,size: 32,))),
                    Positioned(
                      top: 130,
                      left: 20,
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width *0.9,
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
              SizedBox(height: 5,),
              Container(
                height: MediaQuery.of(context).size.height *0.73,
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    backgroundColor:Color(0xff080404) ,
                    appBar: TabBar(
                      tabs: [
                        Tab(text: 'Skills',),
                        Tab(text: 'Names',),

                      ],
                    ),
                    body: TabBarView(
                      children: [
                        Container(
                          child: ListView(
                            children: [
                              SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Actor',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Animator',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Art Director',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Cinematographer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Colorist',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Creative Designer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Dancer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Disc Jockey',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Film Director',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Film Producer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Fine Artist',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Graphic Designer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Hair Stylist',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Illustrator',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Instrumentalist',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Make Up',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Mastering Engineer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Mixing Engineer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Model',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Music Producer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Photo Editor',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Photo Retoucher',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Photographer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Product Designer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Set Designer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Singer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Song Wirter',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Stylist',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('UI / UX',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('VFX Editor',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Video Editor',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Videographer',style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: ListView(
                            children: [
                              SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/alex.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Alex Well',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@alexwell',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/me.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Bubble Buster',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@bubblebuster',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/alex.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Alex Well',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@alexwell',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/me.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Bubble Buster',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@bubblebuster',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/alex.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Alex Well',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@alexwell',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/me.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Bubble Buster',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@bubblebuster',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),   Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/alex.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Alex Well',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@alexwell',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/me.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Bubble Buster',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@bubblebuster',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),   Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/alex.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Alex Well',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@alexwell',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        child : Image.asset('assets/me.jpg',height: 60,width: 60,)),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Bubble Buster',
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
                                        Text('@bubblebuster',
                                          style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],
                                    )
                                  ],
                                ),
                              ),


                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),

              )


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
