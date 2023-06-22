import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
                'lib/assets/thumbnail.jpg',
              width: double.infinity,
              height: 220,
              
            ),
            IconButton(onPressed: (){},
                icon: Icon(Icons.add_circle,
                  size: 30.0,
                )
            )

          ],
        ),
      ),

    );
  }
}
