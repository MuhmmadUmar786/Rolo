import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:rolo/Screen/FilterScreen.dart';
import 'package:rolo/Screen/InboxScreen.dart';
import 'package:rolo/Screen/RolodexScreen.dart';
import 'package:rolo/Screen/UploadScreen.dart';

import 'JobScreen.dart';
import 'ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  List<String> welcomeImages = [
    "assets/alex.jpg",
    "assets/alex.jpg",
    "assets/alex.jpg",
    "assets/alex.jpg",  "assets/alex.jpg",
    "assets/alex.jpg",  "assets/alex.jpg",
    "assets/alex.jpg",  "assets/alex.jpg",
    "assets/alex.jpg",  "assets/alex.jpg",
    "assets/alex.jpg",
    "assets/alex.jpg",  "assets/alex.jpg",
    "assets/alex.jpg",  "assets/alex.jpg",
    "assets/alex.jpg",  "assets/alex.jpg",
    "assets/alex.jpg",  "assets/alex.jpg",
    "assets/alex.jpg",
  ];

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
            MaterialPageRoute(builder: (context) => FilterScreen()),
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

  int _selectedIndex = 0;
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
    else   if(index==3){
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => InboxScreen()),
        );
      });
    }
    else   if(index==2){
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UploadScreen()),
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
        leading: _isSearching ? const BackButton() : Container(),
        title: _isSearching ? _buildSearchField() :Text('Search',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: _buildActions(),
      ),

      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color(0xff080404),
          appBar: TabBar(
            labelStyle: TextStyle(),
            tabs: [
              Tab(text: 'All',),
              Tab(text: 'Logo',),
              Tab(text: 'Branding',),
              Tab(text: 'Packaging',),
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
                        height:MediaQuery.of(context).size.height * 0.4,
                        child: new TinderSwapCard(
                          swipeUp: true,
                          swipeDown: false,
                          orientation: AmassOrientation.BOTTOM,
                          totalNum: welcomeImages.length,
                          stackNum: 3,
                          swipeEdge: 4.0,
                          maxWidth: MediaQuery.of(context).size.width * 1.0,
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          minWidth: MediaQuery.of(context).size.width * 0.93,
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          cardBuilder: (context, index) =>
                              Card(
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
                                              child: Image.asset('${welcomeImages[index]}',height: 80,width:80,fit: BoxFit.cover,)),
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
                                              color: Colors.yellow,
                                              child: Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: Text('AVAILABLE SOON FOR HIRE'),
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
                                        child: Text('Part-time freelancer.Travel + Landscape\n'
                                            'photography is my favorite kind. Always looking to\n'
                                            'expand my portfolio.',
                                        style: TextStyle(fontSize: 12),
                                        )
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 4,),
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
                          cardController: controller = CardController(),
                          swipeUpdateCallback:
                              (DragUpdateDetails details, Alignment align) {
                            /// Get swiping card's alignment
                            if (align.x < 0) {
                              //Card is LEFT swiping
                            } else if (align.x > 0) {
                              //Card is RIGHT swiping
                            }
                          },
                          swipeCompleteCallback:
                              (CardSwipeOrientation orientation, int index) {
                            /// Get orientation & index of swiped card!
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        // color: Colors.white,
                        height:MediaQuery.of(context).size.height * 0.32,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
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
                        height:MediaQuery.of(context).size.height * 0.4,
                        child: new TinderSwapCard(
                          swipeUp: true,
                          swipeDown: false,
                          orientation: AmassOrientation.BOTTOM,
                          totalNum: welcomeImages.length,
                          stackNum: 3,
                          swipeEdge: 4.0,
                          maxWidth: MediaQuery.of(context).size.width * 1.0,
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          minWidth: MediaQuery.of(context).size.width * 0.93,
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          cardBuilder: (context, index) =>
                              Card(
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
                                                  child: Image.asset('${welcomeImages[index]}',height: 80,width:80,fit: BoxFit.cover,)),
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
                                                  color: Colors.yellow,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Text('AVAILABLE SOON FOR HIRE'),
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
                                              child: Text('Part-time freelancer.Travel + Landscape\n'
                                                  'photography is my favorite kind. Always looking to\n'
                                                  'expand my portfolio.',
                                                style: TextStyle(fontSize: 12),
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 4,),
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
                          cardController: controller = CardController(),
                          swipeUpdateCallback:
                              (DragUpdateDetails details, Alignment align) {
                            /// Get swiping card's alignment
                            if (align.x < 0) {
                              //Card is LEFT swiping
                            } else if (align.x > 0) {
                              //Card is RIGHT swiping
                            }
                          },
                          swipeCompleteCallback:
                              (CardSwipeOrientation orientation, int index) {
                            /// Get orientation & index of swiped card!
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        // color: Colors.white,
                        height:MediaQuery.of(context).size.height * 0.32,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
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
                        height:MediaQuery.of(context).size.height * 0.4,
                        child: new TinderSwapCard(
                          swipeUp: true,
                          swipeDown: false,
                          orientation: AmassOrientation.BOTTOM,
                          totalNum: welcomeImages.length,
                          stackNum: 3,
                          swipeEdge: 4.0,
                          maxWidth: MediaQuery.of(context).size.width * 1.0,
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          minWidth: MediaQuery.of(context).size.width * 0.93,
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          cardBuilder: (context, index) =>
                              Card(
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
                                                  child: Image.asset('${welcomeImages[index]}',height: 80,width:80,fit: BoxFit.cover,)),
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
                                                  color: Colors.yellow,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Text('AVAILABLE SOON FOR HIRE'),
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
                                              child: Text('Part-time freelancer.Travel + Landscape\n'
                                                  'photography is my favorite kind. Always looking to\n'
                                                  'expand my portfolio.',
                                                style: TextStyle(fontSize: 12),
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 4,),
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
                          cardController: controller = CardController(),
                          swipeUpdateCallback:
                              (DragUpdateDetails details, Alignment align) {
                            /// Get swiping card's alignment
                            if (align.x < 0) {
                              //Card is LEFT swiping
                            } else if (align.x > 0) {
                              //Card is RIGHT swiping
                            }
                          },
                          swipeCompleteCallback:
                              (CardSwipeOrientation orientation, int index) {
                            /// Get orientation & index of swiped card!
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        // color: Colors.white,
                        height:MediaQuery.of(context).size.height * 0.32,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
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
                        height:MediaQuery.of(context).size.height * 0.4,
                        child: new TinderSwapCard(
                          swipeUp: true,
                          swipeDown: false,
                          orientation: AmassOrientation.BOTTOM,
                          totalNum: welcomeImages.length,
                          stackNum: 3,
                          swipeEdge: 4.0,
                          maxWidth: MediaQuery.of(context).size.width * 1.0,
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          minWidth: MediaQuery.of(context).size.width * 0.93,
                          minHeight: MediaQuery.of(context).size.height * 0.27,
                          cardBuilder: (context, index) =>
                              Card(
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
                                                  child: Image.asset('${welcomeImages[index]}',height: 80,width:80,fit: BoxFit.cover,)),
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
                                                  color: Colors.yellow,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Text('AVAILABLE SOON FOR HIRE'),
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
                                              child: Text('Part-time freelancer.Travel + Landscape\n'
                                                  'photography is my favorite kind. Always looking to\n'
                                                  'expand my portfolio.',
                                                style: TextStyle(fontSize: 12),
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 4,),
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
                          cardController: controller = CardController(),
                          swipeUpdateCallback:
                              (DragUpdateDetails details, Alignment align) {
                            /// Get swiping card's alignment
                            if (align.x < 0) {
                              //Card is LEFT swiping
                            } else if (align.x > 0) {
                              //Card is RIGHT swiping
                            }
                          },
                          swipeCompleteCallback:
                              (CardSwipeOrientation orientation, int index) {
                            /// Get orientation & index of swiped card!
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        // color: Colors.white,
                        height:MediaQuery.of(context).size.height * 0.32,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/alex.jpg',height: 110,width: 110,fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/me.jpg',height: 110,width: 110,fit: BoxFit.cover,),
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
