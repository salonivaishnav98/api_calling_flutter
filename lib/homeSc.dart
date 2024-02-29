import 'package:flutter/material.dart';

class HomeSc1 extends StatelessWidget {
  final String? username;
  const HomeSc1({super.key,this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(username!)

        ],
      ),
    );
  }
}
