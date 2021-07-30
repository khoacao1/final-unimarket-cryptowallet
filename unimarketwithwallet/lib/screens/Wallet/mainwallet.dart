import 'package:flutter/material.dart';
import 'package:unimarketwithwallet/screens/Wallet/add_view.dart';
import 'package:unimarketwithwallet/screens/Wallet/cryptolist.dart';
import 'package:unimarketwithwallet/screens/Wallet/remove_view.dart';
import 'package:unimarketwithwallet/screens/home.dart';
import 'package:unimarketwithwallet/shared/appbar.dart';
import 'package:unimarketwithwallet/shared/drawer.dart';

class MainWallet extends StatefulWidget {
  const MainWallet({Key? key}) : super(key: key);

  @override
  _MainWalletState createState() => _MainWalletState();
}

class _MainWalletState extends State<MainWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: Text('Crypto Wallet'),
        appBar: AppBar(),
        onpress: () async {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        },
        label: Text("Cancel"),
        icon: Icon(Icons.cancel),
      ),
      drawer: DrawerCommon(),
      body: CryptoList(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddView(),
                ),
              );
            },
            backgroundColor: Color(0xFF29BF12),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RemoveView(),
                ),
              );
            },
            backgroundColor: Color(0xFF29BF12),
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
