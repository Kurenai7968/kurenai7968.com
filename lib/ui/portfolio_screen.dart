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
  List<ProductModel> _products = [];

  List<Widget> productsWidget(double width, List<ProductModel> products) {
    return products.map((model) {
      // if width > 700 return web size, else return mobile size
      if (width > 700)
        return Container(
          width: width / 2,
          height: 350,
          child: AppInfo(model),
        );
      else
        return Container(
          width: width,
          height: 350,
          child: AppInfo(model),
        );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> lang = AppLocalizations.of(context).lang;
    _products = [
      ProductModel(
        lang['unit_converter']!,
        imagePath: 'assets/images/unit_converter.jpg',
        appStoreUrl:
            'https://apps.apple.com/app/converter-common-units-convert/id1570015168',
        googlePlayUrl:
            'https://play.google.com/store/apps/details?id=com.kurenai7968.unit_converter',
      ),
      ProductModel(
        lang['qr_code_reader']!,
        imagePath: 'assets/images/qr_code_reader.jpg',
        appStoreUrl:
            'https://apps.apple.com/app/qr-scanner-custom-generator/id1559222251',
        googlePlayUrl:
            'https://play.google.com/store/apps/details?id=com.kurenai7968.qr_code_reader',
        color: Colors.black,
        isBlackStyle: false,
      ),
    ];
    return Scaffold(
      body: Wrapper(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Wrap(
                children: productsWidget(constraints.maxWidth, _products),
              );
            },
          ),
        ),
      ),
    );
  }
}
