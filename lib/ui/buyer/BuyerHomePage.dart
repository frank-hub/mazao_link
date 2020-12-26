import 'package:flutter/material.dart';
import 'package:mazao_link/components/horizonta_listview.dart';
import 'package:mazao_link/components/products.dart';
class BuyerHome extends StatefulWidget {
  @override
  _BuyerHomeState createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buyer"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_business_sharp),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_cart),
            title: new Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.library_books),
            title: new Text('Orders'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            backgroundColor: Colors.black
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          //image carousel begins here
//          image_carousel,

          //padding widget
          Padding(padding: const EdgeInsets.all(4.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text('Categories')),),

          //Horizontal list view begins here
          HorizontalList(),

          //padding widget
           Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child:  Text('Recent products')),),

          //grid view
          Flexible(child: Products()),

        ],
      ),
    );
  }
}
