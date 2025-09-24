import 'package:flutter/material.dart';
import 'package:addlens_assign/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  List<ProductModel> _cartItems = [];

  CartProvider() {
    loadCart();
  }

  List<ProductModel> get cartItems => _cartItems;

  int get cartCount => _cartItems.length;

  void addToCart(ProductModel product) {
    _cartItems.add(product);
    saveCart();
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _cartItems.removeWhere((item) => item.id == product.id);
    saveCart();
    notifyListeners();
  }

  bool isInCart(ProductModel product) {
    return _cartItems.any((item) => item.id == product.id);
  }

  void clearCart() {
    _cartItems.clear();
    saveCart();
    notifyListeners();
  }

  // Save cart to SharedPreferences
  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartJson = _cartItems.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('cart', cartJson);
  }

  // Load cart from SharedPreferences
  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      _cartItems = cartJson.map((item) => ProductModel.fromJson(jsonDecode(item))).toList();
      notifyListeners();
    }
  }
}
