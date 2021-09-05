class ProductModel {
  final String name;
  final String? appStoreUrl;
  final String? googlePlayUrl;
  final String imagePath;
  bool isBlackStyle;

  ProductModel(
    this.name, {
    required this.imagePath,
    this.appStoreUrl,
    this.googlePlayUrl,
    this.isBlackStyle = true,
  });
}
