import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app/app.dart';

void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  runApp(const App());
}
