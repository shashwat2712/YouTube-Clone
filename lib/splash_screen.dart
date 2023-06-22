import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children:  [

            Container(

                height: 500,
                child: Image(
                  image: AssetImage("lib/assets/img.png"),
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 20),
            Text("Acadnect",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text("Streamline Your Classroom ",
                  style: TextStyle(
                      fontSize: 15.0

                  )

              ),
            ),
            Text("The App that Helps You Stay Ahead of Your Tasks"),

            SizedBox(height: 30),

          ],
        ),
      ),

    );

  }
}
