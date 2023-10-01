import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/const.dart';
import 'package:project/screens/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorType = EasyLoadingIndicatorType.pulse
      ..indicatorSize = 45.0
      ..radius = 8.0
      ..backgroundColor = whiteColor
      ..textColor = primaryColor
      ..maskType = EasyLoadingMaskType.black
      ..indicatorColor = primaryColor
      ..boxShadow = [
        const BoxShadow(
            color: Color.fromARGB(255, 123, 123, 123),
            offset: Offset(1, 1),
            blurRadius: 3)
      ]
      ..progressColor = Colors.green;

    return GetMaterialApp(
      title: '',
      builder: EasyLoading.init(),
      theme: ThemeData(
        fontFamily: 'Poppins-Regular',
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
