import 'package:go_router/go_router.dart';

import '../screens/profile/screens/all_users.dart';
import '../screens/profile/screens/profile.dart';

final profileRoute = [
  GoRoute(
    path: ProfileScreen.path,
    name: ProfileScreen.routeName,
    builder: (context, state) => const ProfileScreen(),
  ),
  GoRoute(
    path: AllUsers.path,
    name: AllUsers.routeName,
    builder: (context, state) => const AllUsers(),
  ),
];
