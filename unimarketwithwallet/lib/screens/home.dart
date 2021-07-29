import 'package:flutter/material.dart';
import 'package:unimarketwithwallet/screens/sellitem.dart';
import 'package:unimarketwithwallet/services/auth.dart';
import 'package:unimarketwithwallet/shared/appbar.dart';
import 'package:unimarketwithwallet/shared/drawer.dart';
import 'package:unimarketwithwallet/shared/itemlist.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  // Create instant object _auth
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: Text(''),
        appBar: AppBar(),
        onpress: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SellItem()));
        },
        label: Text("Sell an Item"),
        icon: Icon(Icons.sell),
      ),
      drawer: DrawerCommon(),
      body: ItemList(),
    );
  }
}
