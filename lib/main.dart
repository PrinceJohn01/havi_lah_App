import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:havi_lah/screens/signup_screen.dart';

import 'core/homeController/home_controller.dart';
import 'core/utils/size_utils.dart';

Future<void> main() async {
  Get.put(HomeController());

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(), // Your app's widget tree
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SignUp(),
      );
    });
  }
}
