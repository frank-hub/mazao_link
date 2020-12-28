import 'dart:async';

import 'package:flutter/material.dart';
class SupplierHome extends StatefulWidget {
  @override
  _SupplierHomeState createState() => _SupplierHomeState();
}

class _SupplierHomeState extends State<SupplierHome> {
  @override
  void dispose() {
    indexcontroller.close();
    super.dispose();
  }
  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mazao Link Supplier'),
      ),
      drawer: Drawer(
        child: ListView(

          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 20.0),
                child: ListTile(
                  leading: CircleAvatar(

                    radius: 20.0,
                  ),
                  title: Text("Username"),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,

                //shape: BoxShape.circle,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance,
                color: Colors.blue,
              ),
              title: Text('Account'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(
                Icons.store,
                color: Colors.blue,
              ),
              title: Text('Reports'),
              onTap: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => null,
                      )),
            ),
            Divider(
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.blue,
              ),
              title: Text('Buyers'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              thickness: 2.0,
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.blue,
              ),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          indexcontroller.add(index);
        },
        controller: pageController,
        children: <Widget>[
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Orders'),
          ),
          Center(
            child: Text('Products'),
          ),
          Center(
            child: Text('Delivery'),
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
                    icon: Icon(Icons.home), title: Text('Home',style: TextStyle(color: Colors.black),)),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.reorder), title: Text('Orders')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.store), title: Text('Products')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.emoji_transportation), title: Text('Delivery')),
              ],
              onItemSelected: (int value) {
                indexcontroller.add(value);
                pageController.jumpToPage(value);
              },
            );
          }),
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
        this.activeColor,
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
  Color activeColor;
  Color inactiveColor;
  Color backgroundColor;
  List<FancyBottomNavigationItem> items;
  int _selectedIndex;
  ValueChanged<int> onItemSelected;

  _FancyBottomNavigationState(
      {@required this.items,
        this.currentIndex,
        this.activeColor,
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
