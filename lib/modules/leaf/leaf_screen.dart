import 'package:flutter/material.dart';

class LeafScreen extends StatelessWidget {
  const LeafScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Leaf Screen',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'roboto',
          ),
        ),
      ),
    );
  }
}
