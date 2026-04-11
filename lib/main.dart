import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/Theme_changer_provider.dart';
import 'package:provider_practice/provider/count_provider.dart';
// Replace 'my_provider_app' with whatever name is on line 1 of your pubspec.yaml
import 'package:provider_practice/provider/example_one_provider.dart';
import 'package:provider_practice/provider/favorite_provider.dart';
import 'package:provider_practice/screen/Dark_theme.dart';
import 'package:provider_practice/screen/example_one.dart';
import 'package:provider_practice/screen/favorite/favorite_screen.dart';
import 'package:provider_practice/screen/value_notifier_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. MultiProvider or ChangeNotifierProvider must be at the top
    // of your widget tree so that all screens can access the data.
   //
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => favoriteitemsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'Flutter Provider Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          home:NotifyListenerScreen(), // This points to your screen file
        );
      }
      )
    );
  }
}