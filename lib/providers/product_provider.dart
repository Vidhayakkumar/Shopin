import 'package:addlens_assign/model/product_model.dart';
import 'package:addlens_assign/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  bool _isLoading = false;
  List<ProductModel> _products = [];

  bool get isLoading => _isLoading;
  List<ProductModel> get products => _products;

  final ProductService service = ProductService();

  Future<void> getProductList() async {
    try {
      _isLoading = true;
      notifyListeners();

      _products = await service.getProducts();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print(e.toString());
    }
  }
}
