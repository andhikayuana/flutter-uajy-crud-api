import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_belanja_api/src/data/model/product.dart';
import 'package:flutter_crud_belanja_api/src/data/remote/belanja_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addProductViewModelProvider =
    ChangeNotifierProvider.autoDispose<AddProductViewModel>((ref) {
  return AddProductViewModel();
});

class AddProductViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String name;
  int price;

  void onChangedProductName(String value) {
    name = value;
    notifyListeners();
  }

  void onChangedProductPrice(String value) {
    price = value.isEmpty ? 0 : int.parse(value);
    notifyListeners();
  }

  Future<void> onPressedSave(OnSuccessProductAdded successCallback) async {
    if (formKey.currentState.validate()) {
      //todo
      final newProduct = Product(
        name: name,
        price: price,
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/MVVMPattern.png/500px-MVVMPattern.png",
      );

      final Response response = await BelanjaApi().postProduct(newProduct);
      final addedProduct =
          Product.fromMap((response.data["data"] as Map<String, dynamic>));
      successCallback(addedProduct);
    }
  }
}

//callback
typedef OnSuccessProductAdded = Function(Product product);
