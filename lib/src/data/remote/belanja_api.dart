import 'package:dio/dio.dart';
import 'package:flutter_crud_belanja_api/src/data/model/product.dart';

class BelanjaApi {
  static final BelanjaApi _singleton = BelanjaApi._internal();
  static final String baseUrl = "https://belanja-api.herokuapp.com";
  final Dio http = Dio();

  factory BelanjaApi() {
    return _singleton;
  }

  BelanjaApi._internal();

  Future<Response> getProducts() async {
    try {
      Response response = await http.get("$baseUrl/products");
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<Response> getProductById(int id) async {
    try {
      Response response = await http.get("$baseUrl/products/$id");
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<Response> postProduct(Product product) async {
    try {
      Response response =
          await http.post("$baseUrl/products", data: product.toMap());
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<Response> putProduct(Product product, int id) async {
    try {
      Response response =
          await http.put("$baseUrl/products/$id", data: product.toMap());
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<Response> deleteProduct(int id) async {
    try {
      Response response = await http.delete("$baseUrl/products/$id");
      return response;
    } catch (e) {
      print(e);
    }
  }
}
