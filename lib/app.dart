import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picture_edit/config.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/log.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Config.appName,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffD0BCFF),
          elevation: 10.0,
          shadowColor: Colors.black54,
        ),
      ),
      logWriterCallback: getMaterialLogWriterCallback,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
