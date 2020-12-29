
import 'package:flutter/cupertino.dart';

class CurrentUser {
  final String uid;

   CurrentUser({
    this.uid,
  });
}
class UserData {
  String uid;
  String name;
  String email;
  String county;
  String location;
  String gender;
  int phone;
  String address;
  bool buyer;
  bool seller;
  UserData(
      { @required this.uid,
      @required this.location,
       @required this.name,
        @required    this.email,
        @required   this.address,
        @required  this.county,
        @required this.phone,
        @required this.gender,
        @required  this.buyer,
        @required this.seller
      });
}
