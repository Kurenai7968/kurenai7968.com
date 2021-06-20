import 'package:flutter/material.dart';
import 'package:portfolio/services/screen_size.dart';

class Wrapper extends StatefulWidget {
  final Widget child;
  const Wrapper({Key? key, required this.child}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: ScreenSize().appBarHeight,
                ),
                widget.child,
              ]),
            ),
          ),
          Container(
            height: ScreenSize().appBarHeight,
            width: double.infinity,
            child: CustomAppBar(),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Color(0xEE000000),
      child: Row(
        children: [
          GestureDetector(
            // onTap: () => html.window.open(html.window.location.href, '_blank'),
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
