import 'package:flutter/material.dart';
import 'package:flyin_social_media_app/media_info.dart';
import 'package:timeago/timeago.dart';

class VideoCard extends StatelessWidget {
  final String videoTitle;
  final String videoAuthor;
  final String viewCount;
  final String timeStamp;

   VideoCard({
     super.key,
     required this.videoTitle,
     required this.videoAuthor,
     required this.viewCount,
     required this.timeStamp,


}) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MediaInfo()));
      },
      child: Column(
        children: [
          Image.asset('lib/assets/thumbnail.jpg',
            height: 220.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage('lib/assets/person-icon.png'),
                ),
                const SizedBox(width: 8.0,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(child: Text(
                        videoTitle,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text(

                              videoAuthor,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              maxLines: 2,

                            overflow: TextOverflow.ellipsis,
                          )),
                          Flexible(child: Text(
                            viewCount,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Flexible(child: Text(
                            // '${timeago.format(timestamp)}',
                            timeStamp,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),

                    ],
                  ),
                ),
                Icon(Icons.more_vert,
                  size: 20.0,
                ),
              ],
            ),
          )


        ],

      ),
    );
  }
}
