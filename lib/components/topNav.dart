import 'package:flutter/material.dart';
import 'package:mazao_link/models/user.dart';
import 'package:mazao_link/services/database.dart';
import 'package:mazao_link/ui/shared/loading.dart';
import 'package:provider/provider.dart';
class TopNav extends StatefulWidget {
  @override
  _TopNavState createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
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
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser>(context);
      return  StreamBuilder<Object>(
          stream: DatabaseService(uid:user.uid).userData,
          builder: (context, snapshot) {
            UserData userData=snapshot.data;
            if(!snapshot.hasData){
              return Loading();
            }
            return Padding(
              padding: EdgeInsets.only(top: 0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 320,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                                colors: [Colors.green[600], Colors.green[300]]),
                            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(60.0),bottomRight: Radius.circular(60.0))
                        ),
                        child:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(45 ,50 , 10,0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mazao Link',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  IconButton(
                                    onPressed: (){},
                                    color: Colors.white,
                                    icon: Icon(Icons.shopping_bag),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            Padding(
                              padding: EdgeInsets.only(right: 180),
                              child: Text('Good '+greeting() +'\n' +userData.name,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(40,45,40,0),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search What You Looking For...',
                                    prefixIcon: Icon(Icons.search,color: Colors.green,),
                                    suffixIcon: Icon(Icons.menu_open,color: Colors.green,),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0)
 
                                    )
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
      );

  }
}
