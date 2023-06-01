import 'package:flutter/material.dart';
import 'package:internet_connectionn_checker/share.dart';

class Con extends StatelessWidget {
  const Con({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Center(child: AddToCartWidget(backgroundColor: Colors.red,buttonIcon: Icon(Icons.account_circle),height: 100,text: "Add to cart ",showDivider: false,)),
        ],
      ),
    );
  }
}
