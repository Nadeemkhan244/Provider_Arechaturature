import 'package:flutter/material.dart';
class statfull extends StatefulWidget {
  const statfull({super.key});

  @override
  State<statfull> createState() => _statfullState();
}

class _statfullState extends State<statfull> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('khan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Center(child: Text(count.toString() , style: TextStyle(fontSize: 50),)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count++ ;
          print(count++);
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
