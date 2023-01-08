// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;
  int quantity = 0;
  // ignore: non_constant_identifier_names
  int get Counter => _counter;

  int _totalprice = 0;
  // ignore: non_constant_identifier_names
  int get TotalPrice => _totalprice;

  void setPrefitems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setInt('cart_items', _counter);
    pref.setInt('total_price', _totalprice);
    notifyListeners();
  }

  void getPrefitems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _counter = pref.getInt('cart_items') ?? 0;
    _totalprice = pref.getInt('total_price') ?? 0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    setPrefitems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    setPrefitems();
    notifyListeners();
  }

  int getCounter() {
    getPrefitems();
    return _counter;
  }

  ///TotalPrice Logic;
  void addTotalPrice(int productprice) {
    _totalprice += productprice;
    setPrefitems();
    notifyListeners();
  }

  void removeTotalprice(int productprice) {
    _totalprice -= productprice;
    setPrefitems();
    notifyListeners();
  }

  int getTotalprice() {
    getPrefitems();
    return _totalprice;
  }

  incremetQuantity() {
    
    quantity++;
    notifyListeners();
  }
}
