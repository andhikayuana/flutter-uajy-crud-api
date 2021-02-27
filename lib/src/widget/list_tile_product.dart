import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_belanja_api/src/data/model/product.dart';

class ListTileProduct extends StatelessWidget {
  const ListTileProduct(
    Product this.product, {
    Key key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: product.image,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      title: Text("${product.id} : ${product.name}"),
      subtitle: Text("Rp ${product.price}"),
    );
  }
}
