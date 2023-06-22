import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyin_social_media_app/components/video_card.dart';
import 'package:flyin_social_media_app/video_making_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String str = FirebaseAuth.instance.currentUser?.phoneNumber.toString()?? "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(
          children: [
            VideoCard(videoTitle: 'A YouTube video title is an important part of your video’s performance on YouTube for two main reasons:', videoAuthor: 'Bablon', viewCount: '90', timeStamp: '2 hours ago',),
            VideoCard(videoTitle: 'A YouTube video title is an important part of your video’s performance on YouTube for two main reasons:', videoAuthor: '', viewCount: '', timeStamp: '',),
            VideoCard(videoTitle: '', videoAuthor: '', viewCount: '', timeStamp: '',),

          ],
        ),
      ),









      // CustomScrollView(
      // slivers: [
      //   SliverAppBar(
      //       leadingWidth: 100.0,
      //       leading: Image.asset('lib/assets/logo.png'),
      //       backgroundColor: Colors.black87,
      //       actions:  [
      //
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: IconButton(
      //             icon: Icon(Icons.notification_add_outlined),
      //             onPressed: (){},
      //           ),
      //         )
      //       ],
      //   ),







      backgroundColor: Colors.white,

    );
  }
}
