import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controllers/services/shared_preferences_manager.dart';
import 'core/utils/constant/constants.dart';
import 'core/utils/helpers.dart';
import 'core/utils/theme/dark_theme.dart';
import 'routes/routes.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesManager.init();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final router = ref.watch(routes);

    return ScreenUtilInit(
      designSize:
          (AppHelpers.isLargeScreen(context) || AppHelpers.isLandScape(context))
              ? Size(900, 1200)
              : Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: AppConstants.appName,
        theme: darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        routerConfig: routes,
      ),
    );
  }
}
