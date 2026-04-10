import 'package:flutter/material.dart';
class favoriteitemsProvider with ChangeNotifier{
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;
  void addItems(int value){
    _selectedItem.add(value);
    notifyListeners();
  }
  void removeItem(int value){
    _selectedItem.remove(value);
    notifyListeners();
  }
}