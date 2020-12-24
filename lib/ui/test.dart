import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mazao_link/services/auth.dart';
class Test extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final _formKey1 = GlobalKey<FormState>();
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  bool loading = false;
  String email = '';
  String password = '';
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 60,),
          Image.asset("assets/images/logo.png",
            height: 150,
          ),
          DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.green,
                    tabs: [
                      Tab(child: FlatButton.icon(
                          onPressed: null, icon: Icon(Icons.login,color: Colors.green,),
                          label: Text('Sign In',
                          style: TextStyle(color: Colors.green,fontSize: 15.0),)),),
                      Tab(child: FlatButton.icon(
                          onPressed: null, icon: Icon(Icons.account_box_outlined,color: Colors.green,),
                          label: Text('Sign Up',style: TextStyle(color: Colors.green,fontSize: 15.0),),
                      ),),

                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(

                    height: 460, //height of TabBarView

                    child: TabBarView(children: <Widget>[

                      Form(
                        key: _formKey,

                          child: Container(
                            height: 400.0,
                            width: 450.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.transparent,
                                    blurRadius: 5.0,
                                    spreadRadius: 5.0,
                                    offset: Offset(15.0, 15.0),
                                  ),
                                ]),
                            child: ListView(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: username_controller,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Email';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: 'Email Address',
                                        labelText: 'Email Address',
                                        labelStyle: TextStyle(color: Colors.black),
                                        hintStyle:
                                        TextStyle(color: Colors.green),
                                        prefixIcon: new Icon(Icons.email,
                                            color: Colors.black54),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.brown[200],
                                            width: 2.0,
                                          ),
                                          borderRadius: BorderRadius.circular(20.0),
                                        )),
                                  ),
                                ),
                                new SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: password_controller,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Password';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.black),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.green,
                                      ),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      prefixIcon: new Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.black87,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.white70,
                                          width: 5.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.brown[200],
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 60.0,
                                    right: 60.0,
                                  ),
                                  child: new RaisedButton(
                                    splashColor: Colors.white,
                                    elevation: 10.0,
                                    padding: EdgeInsets.symmetric(vertical: 13.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    onPressed: () async {
                                      // if(_formKey.currentState.validate()){
                                      //   setState(() {
                                      //     loading= true;
                                      //   });
                                      //   dynamic result = await _auth.signInWithEmailAndPass(username_controller.text, password_controller.text);
                                      //
                                      //   if(result== null){
                                      //     setState((){
                                      //       loading = false;
                                      //       AwesomeDialog(
                                      //           context: context,
                                      //           dialogType: DialogType.ERROR,
                                      //           animType: AnimType.RIGHSLIDE,
                                      //           headerAnimationLoop: false,
                                      //           title: 'Error',
                                      //           desc:
                                      //           'Wrong Credentials,Try Again!!',
                                      //           btnOkOnPress: () {},
                                      //           btnOkIcon: Icons.cancel,
                                      //           btnOkColor: Colors.red)
                                      //         ..show();
                                      //     });
                                      //   }else{
                                      //     setState(() {
                                      //       loading = false;
                                      //       AwesomeDialog(
                                      //           context: context,
                                      //           animType: AnimType.LEFTSLIDE,
                                      //           headerAnimationLoop: false,
                                      //           dialogType: DialogType.SUCCES,
                                      //           title: 'Success',
                                      //           desc:
                                      //           'Login Successful',
                                      //           btnOkOnPress: () {
                                      //             debugPrint('OnClick');
                                      //           },
                                      //           btnOkIcon: Icons.check_circle,
                                      //           onDissmissCallback: () {
                                      //             debugPrint('Dialog Dissmiss from callback');
                                      //           })..show();
                                      //
                                      //     });}
                                      //   // Navigator.push(
                                      //   //     context,
                                      //   //     MaterialPageRoute(
                                      //   //       builder: (context) => HomePage(),
                                      //   //     ));
                                      //
                                      // }
                                    },
                                    color: Colors.green[600],
                                    child: new Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25.0,),
                                Padding( padding: const EdgeInsets.only(
                                  left: 60.0,
                                  right: 60.0,),
                                  child: _SignInBtn(),
                                ),

                              ],
                            ),
                          ),

                        ),

                        Form(
                          key: _formKey1,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              new Container(
                                height: 450.0,
                                width: 450.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.transparent,
                                        blurRadius: 5.0,
                                        spreadRadius: 5.0,
                                        offset: Offset(15.0, 15.0),
                                      ),
                                    ]),
                                child: ListView(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: TextFormField(
                                        validator: (val) =>
                                        val.isEmpty ? 'Enter Full Name' : null,
                                        // controller: emailController,


                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: 'Full Name',
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: 'Full Name',
                                            labelStyle:
                                            TextStyle(color: Colors.black),
                                            hintStyle:
                                            TextStyle(color: Colors.brown),
                                            prefixIcon: new Icon(Icons.email,
                                                color: Colors.green),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0),
                                              borderSide: BorderSide(
                                                color: Colors.green,
                                                width: 5.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.brown[100],
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(20.0),
                                            )),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: TextFormField(
                                        validator: (val) =>
                                        val.isEmpty ? 'Enter an Email' : null,
                                        // controller: emailController,


                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: 'Email Address',
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: 'Email Address',
                                            labelStyle:
                                            TextStyle(color: Colors.black),
                                            hintStyle:
                                            TextStyle(color: Colors.brown),
                                            prefixIcon: new Icon(Icons.email,
                                                color: Colors.green),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0),
                                              borderSide: BorderSide(
                                                color: Colors.green,
                                                width: 5.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.brown[100],
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(20.0),
                                            )),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        obscureText: true,
                                        validator: (val) => val.length < 6
                                            ? 'Enter a password 6+ chars long'
                                            : null,

                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintStyle: TextStyle(
                                            color: Colors.brown,
                                          ),
                                          labelText: 'Password',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          prefixIcon: new Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.green,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                              color: Colors.green,
                                              width: 5.0,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.brown[100],
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        obscureText: true,
                                        validator: (val) {
                                          if (val.isEmpty)
                                            return 'Enter a password 6+ chars long';
                                          if (val != password)
                                            return 'Password Do Not Match';
                                          return null;
                                        },

                                        decoration: InputDecoration(
                                          hintText: 'Confirm Password',
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintStyle: TextStyle(
                                            color: Colors.brown,
                                          ),
                                          labelText: 'Confirm Password',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          prefixIcon: new Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.green,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                              color: Colors.white70,
                                              width: 5.0,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.brown[100],
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.only(
                                        left: 60.0,
                                        right: 60.0,
                                      ),
                                      child: new RaisedButton(
                                        splashColor: Colors.white,
                                        elevation: 10.0,
                                        padding:
                                        EdgeInsets.symmetric(vertical: 13.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.tealAccent),
                                        ),
                                        onPressed: () async {
                                          // if (_formKey.currentState.validate()) {
                                          //   setState(() {
                                          //     loading = true;
                                          //   });
                                          //   dynamic result = await _auth
                                          //       .registerWithEmailAndPass(
                                          //       email, password);
                                          //   if (result ==null) {
                                          //     setState(() {
                                          //       loading = false;
                                          //
                                          //       AwesomeDialog(
                                          //           context: context,
                                          //           dialogType: DialogType.ERROR,
                                          //           animType: AnimType.RIGHSLIDE,
                                          //           headerAnimationLoop: false,
                                          //           title: 'Error',
                                          //           desc:
                                          //           'Please supply a valid email',
                                          //           btnOkOnPress: () {},
                                          //           btnOkIcon: Icons.cancel,
                                          //           btnOkColor: Colors.red)
                                          //         ..show();
                                          //     });
                                          //   }
                                          //   else{
                                          //     setState(() {
                                          //       loading = false;
                                          //       AwesomeDialog(
                                          //           context: context,
                                          //           animType: AnimType.LEFTSLIDE,
                                          //           headerAnimationLoop: false,
                                          //           dialogType: DialogType.SUCCES,
                                          //           title: 'Success',
                                          //           desc:
                                          //           'Register Successful',
                                          //           btnOkOnPress: () {
                                          //             debugPrint('OnClcik');
                                          //           },
                                          //           btnOkIcon: Icons.check_circle,
                                          //           onDissmissCallback: () {
                                          //             debugPrint('Dialog Dissmiss from callback');
                                          //           })
                                          //         ..show();
                                          //
                                          //     });
                                          //   }
                                          // }
                                        },
                                        color: Colors.green,
                                        child: new Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


                    ])
                )
              ])
          ),
        ]),
      ),
    );
  }
  Widget _SignInBtn(){
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: (){
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/google.png",
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Sign In With Google",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      )


      ,
    );
  }
}
