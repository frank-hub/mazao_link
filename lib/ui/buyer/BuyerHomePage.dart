import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mazao_link/components/topNav.dart';
import 'package:mazao_link/models/user.dart';
import 'package:mazao_link/services/auth.dart';
import 'package:mazao_link/services/database.dart';
import 'package:mazao_link/ui/shared/loading.dart';
import 'package:mazao_link/ui/supplier/SupplierHomePage.dart';
import 'package:provider/provider.dart';
class BuyerHome extends StatefulWidget {
  @override
  _BuyerHomeState createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
  @override
  void dispose() {
    indexcontroller.close();
    super.dispose();
  }
  TextStyle style=TextStyle(
    fontWeight: FontWeight.bold,

  );
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }
  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();
  int index = 0;
  final AuthService _auth= AuthService();
  User _user= FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser>(context);
    return  StreamBuilder<Object>(
      stream: DatabaseService(uid:user.uid).userData,
      builder: (context, snapshot) {


        if(!snapshot.hasData){
          return Loading();
        }else{
          UserData userData=snapshot.data;
        return Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              indexcontroller.add(index);
            },
            controller: pageController,
            children: <Widget>[
              Column(
                children: [
                  TopNav(),
                  SizedBox(height: 20,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage('images/w4.jpeg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  return showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext conext) {
                                      return AlertDialog(
                                        title: Text('Not in stock'),
                                        content:
                                        const Text('This item is no longer available'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(50,20,50,20),
                                    child: Column(
                                      children: [

                                        Text("Gucci Watch",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Chip(
                                          label: Text('Shop Now',style: TextStyle(color: Colors.white),),
                                          shadowColor: Colors.blue,
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          autofocus: true,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage('images/w3.jpeg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  return showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext conext) {
                                      return AlertDialog(
                                        title: Text('Not in stock'),
                                        content:
                                        const Text('This item is no longer available'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(50,20,50,20),
                                    child: Column(
                                      children: [

                                        Text("Gucci Watch",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Chip(
                                          label: Text('Shop Now',style: TextStyle(color: Colors.white),),
                                          shadowColor: Colors.blue,
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          autofocus: true,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage('images/m1.jpeg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  return showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext conext) {
                                      return AlertDialog(
                                        title: Text('Not in stock'),
                                        content:
                                        const Text('This item is no longer available'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(50,20,50,20),
                                    child: Column(
                                      children: [

                                        Text("Gucci Watch",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Chip(
                                          label: Text('Shop Now',style: TextStyle(color: Colors.white),),
                                          shadowColor: Colors.blue,
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          autofocus: true,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {

                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage('images/m2.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  return showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext conext) {
                                      return AlertDialog(
                                        title: Text('Not in stock'),
                                        content:
                                        const Text('This item is no longer available'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(50,20,50,20),
                                    child: Column(
                                      children: [

                                        Text("Gucci Watch",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Chip(
                                          label: Text('Shop Now',style: TextStyle(color: Colors.white),),
                                          shadowColor: Colors.blue,
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          autofocus: true,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('All Products',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('See All',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage('images/w4.jpeg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    return showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext conext) {
                                        return AlertDialog(
                                          title: Text('Not in stock'),
                                          content:
                                          const Text('This item is no longer available'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                      padding: EdgeInsets.fromLTRB(50,20,50,20),
                                      child: Column(
                                        children: [

                                          Text("Gucci Watch",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Chip(
                                            label: Text('Shop Now',style: TextStyle(color: Colors.white),),
                                            shadowColor: Colors.blue,
                                            backgroundColor: Colors.green,
                                            elevation: 10,
                                            autofocus: true,
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage('images/w3.jpeg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    return showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext conext) {
                                        return AlertDialog(
                                          title: Text('Not in stock'),
                                          content:
                                          const Text('This item is no longer available'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                      padding: EdgeInsets.fromLTRB(50,20,50,20),
                                      child: Column(
                                        children: [

                                          Text("Gucci Watch",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Chip(
                                            label: Text('Shop Now',style: TextStyle(color: Colors.white),),
                                            shadowColor: Colors.blue,
                                            backgroundColor: Colors.green,
                                            elevation: 10,
                                            autofocus: true,
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage('images/m1.jpeg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    return showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext conext) {
                                        return AlertDialog(
                                          title: Text('Not in stock'),
                                          content:
                                          const Text('This item is no longer available'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                      padding: EdgeInsets.fromLTRB(50,20,50,20),
                                      child: Column(
                                        children: [

                                          Text("Gucci Watch",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Chip(
                                            label: Text('Shop Now',style: TextStyle(color: Colors.white),),
                                            shadowColor: Colors.blue,
                                            backgroundColor: Colors.green,
                                            elevation: 10,
                                            autofocus: true,
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage('images/m2.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    return showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext conext) {
                                        return AlertDialog(
                                          title: Text('Not in stock'),
                                          content:
                                          const Text('This item is no longer available'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                      padding: EdgeInsets.fromLTRB(50,20,50,20),
                                      child: Column(
                                        children: [

                                          Text("Gucci Watch",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Chip(
                                            label: Text('Shop Now',style: TextStyle(color: Colors.white),),
                                            shadowColor: Colors.blue,
                                            backgroundColor: Colors.green,
                                            elevation: 10,
                                            autofocus: true,
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: Text('Cart'),
              ),
              Center(
                child: Text('Orders'),
              ),
              Padding(
                padding: const EdgeInsets.only(top:0),
                child: Stack(
                  children: [
                    Container(

                       child: Padding(padding: EdgeInsets.all(2.0),
                         child: Container(
                           decoration: BoxDecoration(
                               color: Colors.grey[300],

                           ),
                           child: Column(
                             children: [

                               Container(
                                 height: 240,
                                   decoration: BoxDecoration(
                                       gradient: LinearGradient(
                                           begin: Alignment.topRight,
                                           end: Alignment.bottomRight,
                                           colors: [Colors.green[600], Colors.green[300]]),
                                       borderRadius: BorderRadius.only(bottomLeft:Radius.circular(40.0),bottomRight: Radius.circular(40.0))
                                   ),
                                 child: Row(
                                   children: [

                                     Padding(
                                       padding: const EdgeInsets.only(left: 35.0),
                                       child: Text("Profile",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                                     ),
                                     Padding(
                                       padding: EdgeInsets.only(left: 225.0,top: 160),
                                       child: GestureDetector(
                                         child: new CircleAvatar(
                                           backgroundColor: Colors.white,
                                           radius: 18.0,
                                           child: new Icon(
                                             Icons.edit,
                                             color: Colors.red,
                                             size: 20.0,
                                           ),
                                         ),
                                         onTap: () {
                                         },
                                       ),
                                     ),



                                   ],
                                 )
                               ),
                               Container(
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(10.0)),
                               child: Card(
                                    child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(22),
                                    child: Column(
                                    children: <Widget>[
                                    Column(
                                    children: <Widget>[
                                    ...ListTile.divideTiles(
                                    color: Colors.grey,
                                    tiles: [
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        leading: Icon(Icons.info,color: Colors.green,),
                                        title: Text("Full Name",style: style,),
                                        subtitle: Text(userData.name),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        leading: Icon(Icons.location_city,color: Colors.green,),
                                        title: Text("County",style: style,),
                                        subtitle: Text(userData.county),
                                      ),
                                    ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.my_location,color: Colors.green,),
                                    title: Text("Location",style: style,),
                                    subtitle: Text(userData.address+"  " + userData.location),
                                    ),
                                    ListTile(
                                    leading: Icon(FontAwesomeIcons.genderless,color: Colors.green,),
                                    title: Text("Gender",style: style,),
                                    subtitle: Text(userData.gender),
                                    ),
                                    ListTile(
                                    leading: Icon(Icons.phone,color: Colors.green,),
                                    title: Text("Phone",style: style,),
                                    subtitle: Text("+254"+userData.phone.toString()),
                                    ),
                                    ListTile(
                                    leading: Icon(FontAwesomeIcons.user,color: Colors.green,),
                                    title: Text("About Me",style:style ,),
                                    subtitle: Text(
                                    "This is a about me link and you can know about me in this section."),
                                    )
                                    ],
        ),
        ],
        ),
        ],
        ),
        ),
        ),
        ),
        ]
                               ),
                               ),
        ),


                          ),
                             ],

                           ),
                         ),



                  ],




          ),
          bottomNavigationBar: StreamBuilder<Object>(
              initialData: 0,
              stream: indexcontroller.stream,
              builder: (context, snapshot) {
                int cIndex = snapshot.data;
                return FancyBottomNavigation(
                  currentIndex: cIndex,
                  items: <FancyBottomNavigationItem>[
                    FancyBottomNavigationItem(
                        icon: Icon(Icons.store_mall_directory_outlined), title: Text('Shop')),
                    FancyBottomNavigationItem(
                        icon: Icon(Icons.shopping_cart), title: Text('Cart')),
                    FancyBottomNavigationItem(
                        icon: Icon(Icons.library_books_rounded), title: Text('Orders')),
                    FancyBottomNavigationItem(
                        icon: Icon(Icons.person_pin_outlined), title: Text('Profile')),
                  ],
                  onItemSelected: (int value) {
                    indexcontroller.add(value);
                    pageController.jumpToPage(value);
                  },
                );
              })
        );
        }
      }
    );
  }
}

class FancyBottomNavigation extends StatefulWidget {
  final int currentIndex;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final List<FancyBottomNavigationItem> items;
  final ValueChanged<int> onItemSelected;

  FancyBottomNavigation(
      {Key key,
        this.currentIndex = 0,
        this.iconSize = 24,
        this.activeColor = Colors.green,
        this.inactiveColor,
        this.backgroundColor,
        @required this.items,
        @required this.onItemSelected}) {
    assert(items != null);
    assert(onItemSelected != null);
  }

  @override
  _FancyBottomNavigationState createState() {
    return _FancyBottomNavigationState(
        items: items,
        backgroundColor: backgroundColor,
        currentIndex: currentIndex,
        iconSize: iconSize,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        onItemSelected: onItemSelected);
  }
}

class _FancyBottomNavigationState extends State<FancyBottomNavigation> {
  final int currentIndex;
  final double iconSize;
  Color activeColor = Colors.green;
  Color inactiveColor;
  Color backgroundColor;
  List<FancyBottomNavigationItem> items;
  int _selectedIndex;
  ValueChanged<int> onItemSelected;

  _FancyBottomNavigationState(
      {@required this.items,
        this.currentIndex,
        this.activeColor = Colors.green,
        this.inactiveColor = Colors.black,
        this.backgroundColor,
        this.iconSize,
        @required this.onItemSelected}) {
    _selectedIndex = currentIndex;
  }

  Widget _buildItem(FancyBottomNavigationItem item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? 124 : 50,
      height: double.maxFinite,
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
        color: activeColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: IconThemeData(
                      size: iconSize,
                      color: isSelected ? backgroundColor : inactiveColor),
                  child: item.icon,
                ),
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                style: TextStyle(color: backgroundColor),
                child: item.title,
              )
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    activeColor =
    (activeColor == null) ? Theme.of(context).accentColor : activeColor;

    backgroundColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56,
      padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var index = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              onItemSelected(index);

              setState(() {
                _selectedIndex = index;
              });
            },
            child: _buildItem(item, _selectedIndex == index),
          );
        }).toList(),
      ),
    );
  }
}

class FancyBottomNavigationItem {
  final Icon icon;
  final Text title;

  FancyBottomNavigationItem({
    @required this.icon,
    @required this.title,
  }) {
    assert(icon != null);
    assert(title != null);
  }
}
class ProfileHeader extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const ProfileHeader(
      {Key key,
        @required this.coverImage,
        @required this.avatar,
        @required this.title,
        this.subtitle,
        this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: coverImage, fit: BoxFit.cover),
          ),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
        ),
        if (actions != null)
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.title,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar(
      {Key key,
        @required this.image,
        this.borderColor = Colors.grey,
        this.backgroundColor,
        this.radius = 30,
        this.borderWidth = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor != null
            ? backgroundColor
            : Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image,
        ),
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {},
    );
  }
}