import 'dart:ui';

class ProductModel {
  final String name;
  final String? appStoreUrl;
  final String? googlePlayUrl;
  final Color color;
  final bool isBlackStyle;
  final String imagePath;

  ProductModel(
    this.name, {
    required this.imagePath,
    this.appStoreUrl,
    this.googlePlayUrl,
    this.color = const Color(0xFFFFFFFF),
    this.isBlackStyle = true,
  });
}
