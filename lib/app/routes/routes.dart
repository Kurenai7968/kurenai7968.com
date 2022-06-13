import 'package:go_router/go_router.dart';

import '../../screens/home/home.dart';

class Routes {
  static GoRouter get routes {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}
