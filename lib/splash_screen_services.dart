import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyin_social_media_app/nav_screen.dart';
import 'package:flyin_social_media_app/login_via_phone.dart';
import 'package:flyin_social_media_app/splash_screen.dart';

class SplashScreenService extends StatefulWidget {
  const SplashScreenService({Key? key}) : super(key: key);

  @override
  State<SplashScreenService> createState() => _SplashScreenServiceState();
}

class _SplashScreenServiceState extends State<SplashScreenService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot ){
            //User logged in
            if(snapshot.hasData){
              return NavScreen();
            }
            if(!snapshot.hasData){
              return LoginPhonePage();
            }
            else{
              return SplashScreen();
            }})
            );
  }
}
