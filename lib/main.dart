import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:movie_stream/splash_screen.dart';
import 'splash_screen2.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => SplashScreen1(), // Set SplashScreen1 as the initial route
        '/splash2': (context) => SplashScreen2(), // Define the SplashScreen2 route
        '/home': (context) => HomePage(), // Define the home route
      },
      initialRoute: '/',
    );
  }
}
