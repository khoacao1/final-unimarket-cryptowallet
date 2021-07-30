import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimarketwithwallet/screens/Wallet/wallet_function.dart';
import 'package:unimarketwithwallet/screens/home.dart';
import 'package:unimarketwithwallet/shared/appbar.dart';
import 'package:unimarketwithwallet/shared/constants.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "bitcoin",
    "ethereum",
  ];

  String dropdownValue = "bitcoin";
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: Text('Crypto Wallet'),
        appBar: AppBar(),
        onpress: () async {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        },
        label: Text("Items List"),
        icon: Icon(Icons.backpack),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choose the Crypto Type',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  iconSize: 40,
                  value: dropdownValue,
                  iconEnabledColor: Color(0xFF29BF12),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: coins.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9.]'),
                      ),
                    ],
                    controller: _amountController,
                    decoration: textInputDecoration.copyWith(
                      labelText: "Add Amount",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: RaisedButton(
                    onPressed: () async {
                      await addCoin(dropdownValue, _amountController.text);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add',
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 17)),
                    color: Color(0xFF29BF12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
