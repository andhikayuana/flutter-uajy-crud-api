class AddProductValidator {
  String validateProductName(String value) {
    if (value.isEmpty) {
      return "Nama Produk wajib diisi";
    }
    return null;
  }

  String validateProductPrice(String value) {
    if (value.isEmpty) {
      return "Harga Produk wajib diisi";
    }
    return null;
  }
}
