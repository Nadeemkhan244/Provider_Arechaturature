import 'dart:async';

import 'package:flutter/material.dart';
class provider extends StatefulWidget {
  const provider({super.key});

  @override
  State<provider> createState() => _providerState();
}

class _providerState extends State<provider> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer){
      count++;
      print(count);
      setState(() {

      });
    });
  }
  get child => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Center(
             child: Text(count.toString(),
                       style: TextStyle(fontSize:50),
                       ),
           ),
        ],
      ),
    );
  }
}
