import 'dart:io';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flyin_social_media_app/components/MyButton.dart';
import 'package:flyin_social_media_app/components/image_preview_page.dart';
import 'package:flyin_social_media_app/components/squareTile.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';


class CameraPage extends StatefulWidget {
  static String location = "";
  const CameraPage({Key? key}) : super(key: key);


  @override
  State<CameraPage> createState() => _CameraPageState();
}


class _CameraPageState extends State<CameraPage> {
  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    CameraPage.location = position.toString();

  }

  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                    print('${file?.path}');

                    //Display the image and ask user whether to upload it or not.
                    //Get a reference to storage root
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages = referenceRoot.child('images');
                    if(file == null){
                      return;
                    }

                    String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();


                    //Creating the reference for the image to be stored in firebase.
                    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
                    //uniqueFileName is just the name of reference just under
                    // which the image is stored


                    //So now we have created a path for the image to be stored but not
                    // stored the image yet in the firebase

                    try{
                      //Store the file
                      await  referenceImageToUpload.putFile(File(file!.path));
                      String imageUrl = await referenceImageToUpload.getDownloadURL();

                    }catch(error){

                    }






                  },
                  child: Container(
                    height: 125.0,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: Image.asset('lib/assets/image-gallery.png',
                      height: 40,


                    ),
                  ),

                ),
                GestureDetector(
                  onTap: () async{
                    getLocation();


                    ImagePicker imagePicker = ImagePicker();
                    XFile? file = await imagePicker.pickImage(source: ImageSource.camera);

                    print('${file?.path}');


                    if(file == null){
                      return;
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>ImagePreview(file)
                        )
                    );


                  },
                  child: Container(
                    height: 125.0,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: Image.asset('lib/assets/camera.png',
                      height: 40,


                    ),
                  ),

                  ),
              ],
            ),


            SizedBox(height: 30.0,),


          ],
        ),
      ),
    );
  }
}


