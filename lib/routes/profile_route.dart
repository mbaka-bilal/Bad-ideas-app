import 'package:go_router/go_router.dart';

import '../views/screens/profile/my_profile_screen.dart';

final profileRoute = [
  GoRoute(
    path: MyProfileScreen.path,
    name: MyProfileScreen.routeName,
    builder: (context, state) => const MyProfileScreen(),
  ),
];
