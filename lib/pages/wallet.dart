import 'package:flutter/material.dart';
import 'package:food_app/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                "Wallet",
                style: AppWidget.HeadlineTextFieldStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
