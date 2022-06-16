import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../helper/helper.dart';
import '../routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Kurenai',
      routeInformationProvider: Routes.routes.routeInformationProvider,
      routeInformationParser: Routes.routes.routeInformationParser,
      routerDelegate: Routes.routes.routerDelegate,
      builder: _appBuilder,
    );
  }

  Widget _appBuilder(BuildContext context, Widget? widget) {
    return ResponsiveWrapper.builder(
      widget,
      defaultScale: false,
      minWidth: ScreenSize.mobileBreakPoint,
      breakpoints: const [
        ResponsiveBreakpoint.resize(ScreenSize.mobileBreakPoint, name: MOBILE),
        ResponsiveBreakpoint.resize(ScreenSize.tabletBreakPoint, name: TABLET),
        ResponsiveBreakpoint.resize(ScreenSize.desktopBreakPoint,
            name: DESKTOP),
      ],
    );
  }
}
