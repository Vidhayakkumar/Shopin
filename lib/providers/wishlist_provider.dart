import 'package:addlens_assign/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = [];

  List<ProductModel> get wishlist => _wishlist;

  int get wishlistCount => _wishlist.length;

  WishlistProvider() {
    loadWishlist();
  }

  void addToWishlist(ProductModel product) {
    if (!_wishlist.any((item) => item.id == product.id)) {
      _wishlist.add(product);
      saveWishlist();
      notifyListeners();
    }
  }

  void removeFromWishlist(ProductModel product) {
    _wishlist.removeWhere((item) => item.id == product.id);
    saveWishlist();
    notifyListeners();
  }

  bool isInWishlist(ProductModel product) {
    return _wishlist.any((item) => item.id == product.id);
  }

  void saveWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> encoded =
    _wishlist.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('wishlist', encoded);
  }

  void loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? encoded = prefs.getStringList('wishlist');
    if (encoded != null) {
      _wishlist =
          encoded.map((item) => ProductModel.fromJson(jsonDecode(item))).toList();
      notifyListeners();
    }
  }
}
