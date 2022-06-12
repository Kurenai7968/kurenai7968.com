import 'package:flutter/material.dart';
import 'package:portfolio/models/product_model.dart';
import 'package:portfolio/services/localization.dart';
import 'package:portfolio/ui/components/app_info.dart';
import 'package:portfolio/ui/components/wrapper.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  double _productHeight = 400;
  List<ProductModel> _products = [];

  List<Widget> productsWidget(double width, List<ProductModel> products) {
    List<bool> styles = [true, false, false, true];

    return products
        .asMap()
        .map((index, model) {
          // if width < 700 return mobile size, else return web size
          if (width < 700)
            return MapEntry(
              index,
              Container(
                width: width,
                height: _productHeight,
                child: AppInfo(
                  model..isBlackStyle = index % 2 == 0,
                ),
              ),
            );
          else
            return MapEntry(
              index,
              Container(
                width: width / 2,
                height: _productHeight,
                child: AppInfo(
                  model..isBlackStyle = styles[index % 4],
                ),
              ),
            );
        })
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    _products = [
      // ProductModel(
      //   tr(context, 'insta_repost'),
      //   imagePath: 'assets/images/insta_repost.png',
      //   googlePlayUrl:
      //       'https://play.google.com/store/apps/details?id=com.kurenai7968.insta_repost',
      // ),
      ProductModel(
        tr(context, 'unit_converter'),
        imagePath: 'assets/images/unit_converter.jpg',
        appStoreUrl: 'https://apps.apple.com/app/id1570015168',
        googlePlayUrl:
            'https://play.google.com/store/apps/details?id=com.kurenai7968.unit_converter',
      ),
      ProductModel(
        tr(context, 'qr_code_reader'),
        imagePath: 'assets/images/qr_code_reader.jpg',
        appStoreUrl: 'https://apps.apple.com/app/id1559222251',
        googlePlayUrl:
            'https://play.google.com/store/apps/details?id=com.kurenai7968.qr_code_reader',
      ),
      ProductModel(
        'Resume Builder: Smart CV Maker',
        imagePath: 'assets/images/resume_builder.jpg',
        appStoreUrl: 'https://apps.apple.com/app/id1629296933',
        googlePlayUrl:
            'https://play.google.com/store/apps/details?id=com.kurenai7968.resume_builder',
      ),
    ];

    return Scaffold(
      body: Wrapper(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Wrap(
                children: productsWidget(constraints.maxWidth, _products),
              ),
            );
          },
        ),
      ),
    );
  }
}
