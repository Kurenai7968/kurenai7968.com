import 'package:flutter/material.dart';

class ScreenSize {
  static ScreenSize? _singleton;
  late double height;
  late double width;
  late Orientation orientation;

  factory ScreenSize() {
    if (_singleton == null) {
      _singleton = ScreenSize._();
    }
    return _singleton!;
  }

  void init(BoxConstraints constraints, Orientation orientation) {
    this.height = constraints.maxHeight;
    this.width = constraints.maxWidth;
    this.orientation = orientation;
  }

  ScreenSize._();

  double get appBarHeight => kToolbarHeight;
  double get bodyHeight => height - appBarHeight;
}

class ScreenSizeInit extends StatelessWidget {
  final Widget child;
  const ScreenSizeInit({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            if (constraints.maxWidth != 0) {
              ScreenSize().init(constraints, orientation);
              return child;
            }
            return Container();
          },
        );
      },
    );
  }
}
