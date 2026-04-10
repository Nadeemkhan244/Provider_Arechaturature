import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/example_one_provider.dart'; // Import your provider class

class ExampleOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Specify the Type <ExampleOneProvider> here!
          Consumer<ExampleOneProvider>(
            builder: (context, providerValue, child) {
              return Slider(
                value: providerValue.value,
                onChanged: (val) {
                  providerValue.setValue(val);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}