import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_belanja_api/src/data/model/product.dart';
import 'package:flutter_crud_belanja_api/src/screen/add_product/add_product_screen.dart';
import 'package:flutter_crud_belanja_api/src/screen/detail/detail_screen.dart';
import 'package:flutter_crud_belanja_api/src/screen/home/home_view_model.dart';
import 'package:flutter_crud_belanja_api/src/widget/list_tile_product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(viewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter CRUD API"),
      ),
      body: Container(
        child: FutureBuilder(
          future: viewModel.onGetProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildProductList(context, viewModel.productsData);
            } else if (snapshot.hasError) {
              return Center(
                child: Text("ERROR ${snapshot.error}"),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onPressedAdd(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildProductList(BuildContext context, List<Product> productsData) {
    final productsListTile = productsData
        .map((e) => GestureDetector(
              onTap: () => onProductTap(context, e),
              child: ListTileProduct(e),
            ))
        .toList();

    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: productsListTile,
      ),
    );
  }

  onProductTap(BuildContext context, Product product) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailScreen(product),
    ));
  }

  void onPressedAdd(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AddProductScreen(),
    ));
  }
}
