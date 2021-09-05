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
      height: ScreenSize.height(context),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: ScreenSize.appBarHeight,
                  ),
                  widget.child,
                ],
              ),
            ),
          ),
          Container(
            height: ScreenSize.appBarHeight,
            width: ScreenSize.width(context),
            child: CustomAppBar(),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: ScreenSize.footerHeight,
              width: MediaQuery.of(context).size.width,
              child: Footer(),
            ),
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
      color: Color(0xEE000000),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey[700],
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 20),
            color: Colors.black,
            alignment: Alignment.centerRight,
            child: Text(
              '@2021 Vincent Lam',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
