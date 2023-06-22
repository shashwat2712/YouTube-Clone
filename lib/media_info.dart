import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'components/bullets.dart';

class MediaInfo extends StatefulWidget {
  const MediaInfo({Key? key}) : super(key: key);

  @override
  State<MediaInfo> createState() => _MediaInfoState();
}

class _MediaInfoState extends State<MediaInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        leadingWidth: 100.0,
        leading: Image.asset('lib/assets/logo.png'),
        backgroundColor: Colors.black87,
        actions:  [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.notification_add_outlined),
              onPressed: (){},
            ),
          )
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('lib/assets/thumbnail.jpg',
              height: 220.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 20,),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('How to Title YouTube Videos for More Views',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.thumb_up_alt_outlined,
                    color: Colors.grey[300],
                  ),
                  Icon(Icons.thumb_down_alt_outlined,
                    color: Colors.grey[300],

                  ),
                  Icon(Icons.share,
                    color: Colors.grey[300],
                  ),




                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  MyBullets(text: '20034',leading_icon: Icons.remove_red_eye,),
                  MyBullets(text: '1234',leading_icon: Icons.ios_share_sharp,),
                  MyBullets(text: '2 hrs ago',leading_icon: Icons.timelapse,),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Divider(thickness: 1,color: Colors.grey[300],),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Comments :',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            


          ],
        ),
      ),
    );
  }
}
