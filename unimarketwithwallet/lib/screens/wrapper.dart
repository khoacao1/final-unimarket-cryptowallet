import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimarketwithwallet/models/user.dart';
import 'package:unimarketwithwallet/screens/authenticate/authentication.dart';
import 'package:unimarketwithwallet/screens/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ObjectUser?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
