import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider.dart';
import '../provider/count_provider.dart';
class count_example extends StatefulWidget {
  const count_example({super.key});

  @override
  State<count_example> createState() => _count_exampleState();
}

class _count_exampleState extends State<count_example> {
  void initState(){
    super.initState();
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 1), (timer){
    countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder:(context, value,child){
          return Text(value.count.toString(),
            style: TextStyle(fontSize: 50) );
        } ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            countProvider.setCounter();
            setState(() {

            });
          },
        child: Icon(Icons.add),
      ),
    );
  }
}

extension on CountProvider {
  void setCounter() {}
}
