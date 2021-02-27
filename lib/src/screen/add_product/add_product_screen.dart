import 'package:flutter/material.dart';
import 'package:flutter_crud_belanja_api/src/screen/add_product/add_product_validator.dart';
import 'package:flutter_crud_belanja_api/src/screen/add_product/add_product_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProductScreen extends ConsumerWidget with AddProductValidator {
  const AddProductScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(addProductViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Produk Baru"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Input Nama Produk"),
                onChanged: viewModel.onChangedProductName,
                validator: validateProductName,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Input Harga Produk"),
                keyboardType: TextInputType.number,
                onChanged: viewModel.onChangedProductPrice,
                validator: validateProductPrice,
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.onPressedSave((product) {
                    Navigator.of(context).pop();
                  });
                },
                child: Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
