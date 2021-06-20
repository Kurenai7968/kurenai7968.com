import 'package:flutter/material.dart';
import 'package:portfolio/models/product_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfo extends StatefulWidget {
  final ProductModel model;
  const AppInfo(this.model, {Key? key}) : super(key: key);

  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          color: widget.model.color,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(widget.model.imagePath),
                ),
              ),
              Container(height: 10),
              SelectableText(
                widget.model.name,
                style: TextStyle(
                  fontSize: 18,
                  color:
                      widget.model.isBlackStyle ? Colors.black : Colors.white,
                ),
              ),
              Container(height: 10),
              Container(
                height: 40,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async => widget.model.appStoreUrl != null
                              ? await launch(widget.model.appStoreUrl!)
                              : null,
                          child: Container(
                            child: Image.asset(
                              widget.model.isBlackStyle
                                  ? 'assets/images/app_store_black.png'
                                  : 'assets/images/app_store_white.png',
                              color: widget.model.appStoreUrl == null
                                  ? Color(0xE0B3AFAF)
                                  : null,
                              colorBlendMode: BlendMode.modulate,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () async => widget.model.googlePlayUrl != null
                              ? await launch(widget.model.googlePlayUrl!)
                              : null,
                          child: Container(
                            child: Image.asset(
                              widget.model.isBlackStyle
                                  ? 'assets/images/google_play_black.png'
                                  : 'assets/images/google_play_white.png',
                              color: widget.model.googlePlayUrl == null
                                  ? Color(0xE0B3AFAF)
                                  : null,
                              colorBlendMode: BlendMode.modulate,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
