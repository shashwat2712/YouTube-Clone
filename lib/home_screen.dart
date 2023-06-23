import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyin_social_media_app/components/my_textfield.dart';
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
      backgroundColor: Colors.black54,




      body: Column(
        children: [

          Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('User_Posts')
                    .orderBy('TimeStamp',
                  descending: true,
              ).snapshots(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                      //get the post details
                      final post = snapshot.data!.docs[index];


                      //Converting timestamp to DateTime
                      DateTime dateTime = post['TimeStamp'].toDate();

                      return Column(
                        children: [
                          VideoCard(
                              videoTitle: post['Title'],
                              videoAuthor: 'Author',
                              viewCount: post['Views'],
                              timeStamp: dateTime,
                            ImageData: post['image_url'],
                          ),
                          SizedBox(height: 10,)
                        ],
                      );
                    });

                  }
                  else if(snapshot.hasError){
                    return Center(child: Text('Error:' + snapshot.error.toString()),);
                  }
                  return Center(child: const CircularProgressIndicator());
                },
          )),
        ],
      ),

















    );
  }
}
