import 'package:flutter/material.dart';
class Wallet extends StatefulWidget {
  const Wallet({key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.deepOrange,
                
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.greenAccent,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
