import 'package:flutter/material.dart';

import '../routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      routeInformationParser: Routes.routes.routeInformationParser,
      routerDelegate: Routes.routes.routerDelegate,
    );
  }
}
