import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_belanja_api/src/data/model/product.dart';
import 'package:flutter_crud_belanja_api/src/data/remote/belanja_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModelProvider =
    ChangeNotifierProvider.autoDispose<HomeViewModel>((ref) {
  return HomeViewModel();
});

class HomeViewModel extends ChangeNotifier {
  List<Product> productsData;

  Future<HomeViewModel> onGetProducts() async {
    final Response response = await BelanjaApi().getProducts();

    productsData =
        (response.data["data"] as List).map((e) => Product.fromMap(e)).toList();
    notifyListeners();

    return this;
  }
}
