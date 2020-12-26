import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mazao_link/models/user.dart';
import 'package:mazao_link/services/auth.dart';

import 'package:mazao_link/ui/shared/loading.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  bool loading = false;
  final AuthService _auth = AuthService();
  String error = '';
  @override
  Widget build(BuildContext context) {

    return   loading ? Loading() :Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 70,),
              Image.asset("assets/images/logo.png",
                height: 150,
              ),
              Form(
                key: _formKey,
                child: Expanded(
                  child: ListView(
                    children: [
                      new Padding(padding: const EdgeInsets.all(10.0)),
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
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 5.0,
                                ),
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
                        height: 15.0,
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

                            if(_formKey.currentState.validate()){
                              setState(() {
                                loading= true;
                              });
                              dynamic result = await _auth.signInWithEmailAndPass(username_controller.text, password_controller.text);

                              if(result== null){
                                setState((){
                                  loading = false;
                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.ERROR,
                                      animType: AnimType.RIGHSLIDE,
                                      headerAnimationLoop: false,
                                      title: 'Error',
                                      desc:
                                      'Wrong Credentials,Try Again!!',
                                      btnOkOnPress: () {},
                                      btnOkIcon: Icons.cancel,
                                      btnOkColor: Colors.red)
                                    ..show();
                                });
                              }else{
                                setState(() {
                                  loading = false;
                                  AwesomeDialog(
                                      context: context,
                                      animType: AnimType.LEFTSLIDE,
                                      headerAnimationLoop: false,
                                      dialogType: DialogType.SUCCES,
                                      title: 'Success',
                                      desc:
                                      'Login Successful',
                                      btnOkOnPress: () {
                                        debugPrint('OnClick');
                                      },
                                      btnOkIcon: Icons.check_circle,
                                      onDissmissCallback: () {
                                        debugPrint('Dialog Dissmiss from callback');
                                      })..show();

                                });}
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => HomePage(),
                              //     ));

                            }
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

                      SizedBox(height: 20.0,),
                      Padding( padding: const EdgeInsets.only(
                        left: 60.0,
                        right: 60.0,),
                        child: _SignInBtn(),
                      ),
                      SizedBox(height: 10.0,),
                      Padding(padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                        child: MaterialButton(
                          onPressed:(){
                            widget.toggleView();
                          },
                          child: Text("Sign Up"),),
                      ),
                    ],
                  ),

                ),

              ),

            ],
          ),
        ),
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
