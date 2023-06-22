import 'package:flutter/material.dart';
import 'package:flyin_social_media_app/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flyin_social_media_app/login_via_phone.dart';
import 'package:flyin_social_media_app/splash_screen.dart';
import 'package:flyin_social_media_app/splash_screen_services.dart';
import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenService(),
    );
  }
}

