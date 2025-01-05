import 'package:go_router/go_router.dart';

import '../views/screens/dashboard/root_screen.dart';

final dashboardRoute = [
  GoRoute(
    path: RootScreen.path,
    name: RootScreen.routeName,
    builder: (context, state) => const RootScreen(),
  ),
];
