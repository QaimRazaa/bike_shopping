import 'package:bike_shopping/utils/helpers/app_sizes.dart';
import 'package:bike_shopping/utils/helpers/ui_helper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/routes/generate_routes.dart';
import 'core/routes/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemUIHelper.setFullScreenMode();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        AppSizes.init(context);
        return MediaQuery(
          data: MediaQuery.of(context),
          child: DevicePreview.appBuilder(context, child) ?? const SizedBox(),
        );
      },
      title: 'Bike Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: generateRoute,
    );
  }
}