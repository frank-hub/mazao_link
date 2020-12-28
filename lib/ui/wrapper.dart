import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mazao_link/ui/authenticate/authenticate.dart';
import 'package:mazao_link/models/user.dart';

import 'buyer/BuyerHomePage.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user =Provider.of<CurrentUser>(context);
    if(user == null){
    return Authenticate();
    }else{
      return BuyerHome();
    }
  }
}
