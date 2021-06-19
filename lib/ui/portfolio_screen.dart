import 'package:flutter/material.dart';
import 'package:portfolio/services/localization.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> lang = AppLocalizations.of(context).lang;
    return Scaffold(
      body: Center(
        child: Text(lang['coming_soon']!),
      ),
    );
  }
}
