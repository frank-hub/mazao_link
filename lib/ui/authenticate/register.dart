// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mazao_link/services/auth.dart';
// import 'package:mazao_link/ui/shared/loading.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
//
// class Register extends StatefulWidget {
//   final Function toggleView;
//   Register({this.toggleView});
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();
//   bool loading = false;
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   String email = '';
//   String password = '';
//   String confirmpassword = '';
//   String error = '';
//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? Loading()
//         : Scaffold(
//             key: _scaffoldKey,
//             // backgroundColor: Colors.brown[100],
//             appBar: AppBar(
//               backgroundColor: Colors.green,
//               elevation: 0.0,
//               title: Text("Mazao Link "),
//               actions: <Widget>[
//                 FlatButton.icon(
//                   label: Text(
//                     "Sign In",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   icon: Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     widget.toggleView();
//                   },
//                 )
//               ],
//             ),
//             body: new Stack(
//               fit: StackFit.expand,
//               children: <Widget>[
//                 // new Image.asset(
//                 //   'assets/register4.jpg',
//                 //   fit: BoxFit.cover,
//                 // ),
//                 new ListView(
//                   children: <Widget>[
//                     new Container(
//                       child: Form(
//                         key: _formKey,
//                         child: new Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             new SizedBox(
//                               height: 30.0,
//                             ),
//                             new Padding(padding: EdgeInsets.all(5.0)),
//                             new SizedBox(
//                               height: 10.0,
//                             ),
//                             Text(
//                               'Register',
//                               style: TextStyle(
//                                 color: Colors.green,
//                                 fontSize: 30.0,
//                                 fontWeight: FontWeight.w500,
//                                 shadows: [
//                                   Shadow(
//                                       color: Colors.tealAccent,
//                                       blurRadius: 8.0),
//                                 ],
//                               ),
//                             ),
//                             new Padding(padding: const EdgeInsets.all(10.0)),
//                             new Container(
//                               height: 460.0,
//                               width: 450.0,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Colors.blueAccent,
//                                     width: 1.0,
//                                   ),
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.transparent,
//                                       blurRadius: 5.0,
//                                       spreadRadius: 5.0,
//                                       offset: Offset(15.0, 15.0),
//                                     ),
//                                   ]),
//                               child: ListView(
//                                 children: <Widget>[
//                                   new Padding(
//                                       padding: const EdgeInsets.all(10.0)),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: TextFormField(
//                                       validator: (val) =>
//                                           val.isEmpty ? 'Enter an Email' : null,
//                                       // controller: emailController,
//                                       onChanged: (val) {
//                                         setState(() => email = val);
//                                       },
//                                       style: TextStyle(color: Colors.black),
//                                       decoration: InputDecoration(
//                                           hintText: 'Email Address',
//                                           fillColor: Colors.white,
//                                           filled: true,
//                                           labelText: 'Email Address',
//                                           labelStyle:
//                                               TextStyle(color: Colors.black),
//                                           hintStyle:
//                                               TextStyle(color: Colors.brown),
//                                           prefixIcon: new Icon(Icons.email,
//                                               color: Colors.green),
//                                           border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(20.0),
//                                             borderSide: BorderSide(
//                                               color: Colors.blueAccent,
//                                               width: 5.0,
//                                             ),
//                                           ),
//                                           enabledBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                               color: Colors.brown[100],
//                                               width: 2.0,
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(20.0),
//                                           )),
//                                     ),
//                                   ),
//                                   new SizedBox(
//                                     height: 15.0,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: TextFormField(
//                                       style: TextStyle(color: Colors.black),
//                                       obscureText: true,
//                                       validator: (val) => val.length < 6
//                                           ? 'Enter a password 6+ chars long'
//                                           : null,
//                                       onChanged: (val) {
//                                         setState(() => password = val);
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: 'Password',
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                         hintStyle: TextStyle(
//                                           color: Colors.brown,
//                                         ),
//                                         labelText: 'Password',
//                                         labelStyle: TextStyle(
//                                           color: Colors.black,
//                                         ),
//                                         prefixIcon: new Icon(
//                                           Icons.remove_red_eye,
//                                           color: Colors.green,
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                           borderSide: BorderSide(
//                                             color: Colors.blue,
//                                             width: 5.0,
//                                           ),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.brown[100],
//                                             width: 2.0,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 20.0,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: TextFormField(
//                                       style: TextStyle(color: Colors.black),
//                                       obscureText: true,
//                                       validator: (val) {
//                                         if (val.isEmpty)
//                                           return 'Enter a password 6+ chars long';
//                                         if (val != password)
//                                           return 'Password Do Not Match';
//                                         return null;
//                                       },
//                                       onChanged: (val) {
//                                         setState(() => confirmpassword = val);
//                                       },
//                                       decoration: InputDecoration(
//                                         hintText: 'Confirm Password',
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                         hintStyle: TextStyle(
//                                           color: Colors.brown,
//                                         ),
//                                         labelText: 'Confirm Password',
//                                         labelStyle: TextStyle(
//                                           color: Colors.black,
//                                         ),
//                                         prefixIcon: new Icon(
//                                           Icons.remove_red_eye,
//                                           color: Colors.green,
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                           borderSide: BorderSide(
//                                             color: Colors.white70,
//                                             width: 5.0,
//                                           ),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.brown[100],
//                                             width: 2.0,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 20.0,
//                                   ),
//                                   new Padding(
//                                     padding: const EdgeInsets.only(
//                                       left: 60.0,
//                                       right: 60.0,
//                                     ),
//                                     child: new RaisedButton(
//                                       splashColor: Colors.white,
//                                       elevation: 10.0,
//                                       padding:
//                                           EdgeInsets.symmetric(vertical: 13.0),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(18.0),
//                                         side: BorderSide(
//                                             color: Colors.tealAccent),
//                                       ),
//                                       onPressed: () async {
//                                         if (_formKey.currentState.validate()) {
//                                           setState(() {
//                                             loading = true;
//                                           });
//                                           dynamic result = await _auth
//                                               .registerWithEmailAndPass(
//                                                   email, password);
//                                           if (result ==null) {
//                                             setState(() {
//                                               loading = false;
//
//                                               AwesomeDialog(
//                                                   context: context,
//                                                   dialogType: DialogType.ERROR,
//                                                   animType: AnimType.RIGHSLIDE,
//                                                   headerAnimationLoop: false,
//                                                   title: 'Error',
//                                                   desc:
//                                                   'Please supply a valid email',
//                                                   btnOkOnPress: () {},
//                                                   btnOkIcon: Icons.cancel,
//                                                   btnOkColor: Colors.red)
//                                                 ..show();
//                                             });
//                                           }
//                                           else{
//                                             setState(() {
//                                               loading = false;
//                                               AwesomeDialog(
//                                                   context: context,
//                                                   animType: AnimType.LEFTSLIDE,
//                                                   headerAnimationLoop: false,
//                                                   dialogType: DialogType.SUCCES,
//                                                   title: 'Success',
//                                                   desc:
//                                                   'Register Successful',
//                                                   btnOkOnPress: () {
//                                                     debugPrint('OnClcik');
//                                                   },
//                                                   btnOkIcon: Icons.check_circle,
//                                                   onDissmissCallback: () {
//                                                     debugPrint('Dialog Dissmiss from callback');
//                                                   })
//                                                 ..show();
//
//                                             });
//                                           }
//                                         }
//                                       },
//                                       color: Colors.green,
//                                       child: new Text(
//                                         'Register',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 20.0,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );
//   }
// }
