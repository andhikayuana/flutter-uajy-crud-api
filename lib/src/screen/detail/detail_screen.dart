import 'package:flutter/material.dart';
import 'package:flutter_crud_belanja_api/src/data/model/product.dart';
import 'package:flutter_crud_belanja_api/src/widget/list_tile_product.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.product, {Key key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Produk"),
      ),
      body: Container(
        child: Column(
          children: [ListTileProduct(product)],
        ),
      ),
    );
  }
}
