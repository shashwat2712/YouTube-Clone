import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyin_social_media_app/nav_screen.dart';
import 'package:flyin_social_media_app/otp_verification.dart';

import 'components/MyButton.dart';
import 'components/my_textfield.dart';
import 'components/squareTile.dart';
class LoginPhonePage extends StatefulWidget {
  static String verifyID = "";

  const LoginPhonePage({Key? key}) : super(key: key);

  @override
  State<LoginPhonePage> createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {

  String phone = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  //Since we are making it static we would now be able to use this variable in other pages also.


  final phoneController = TextEditingController();

  final countryCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children:  [
                const SizedBox(height: 50.0,),


                const Icon(
                  Icons.lock,
                  size: 100,
                ),


                const SizedBox(height: 50.0,),


                Text('Enter Your Mobile Number',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16.0)
                ),


                const SizedBox(height: 40.0,),

                //email textfield

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color: Colors.grey.shade200
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40.0,
                        child: TextField(
                          controller: countryCodeController,
                          decoration: InputDecoration(
                            hintText: '+91',
                            border: InputBorder.none,
                          ),
                        ),

                      ),
                      SizedBox(width: 5.0,),
                      Text('|',
                        style: TextStyle(
                          fontSize: 33.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            onChanged: (value){
                              phone = value;
                            },

                            decoration: InputDecoration(
                              hintText: "*********",
                              border: InputBorder.none,

                            )
                            ,
                          )),
                    ],
                  ),
                ),





                const SizedBox(height: 40.0,),

                MyButton(
                  onTap: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: countryCodeController.text+phone,
                      verificationCompleted: (PhoneAuthCredential credential)async {
                        await auth.signInWithCredential(credential);

                      },
                      verificationFailed: (FirebaseAuthException e) {
                        showDialog(context: context,
                          builder: (context) {
                            return AlertDialog(title: Text(e.code.toString()),);
                          },
                        );
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        LoginPhonePage.verifyID = verificationId;

                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=> NavScreen())
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );


                  },
                  text: 'Send The Code',
                ),

                const SizedBox(height: 25.0,),

                Row(
                  children: [
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),

                    Text('Or Continue with'),

                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                  ],
                ),

                const SizedBox(height: 25.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    //Google Button
                    SquareTile(imagePath: 'lib/assets/google.png'),

                    SizedBox(width: 25.0,),

                    //Apple Button
                    SquareTile(imagePath: 'lib/assets/apple.png',)
                  ],
                ),
                SizedBox(height: 25.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    GestureDetector(
                      onTap: (){},
                      child: Text('Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                        ),),
                    )
                  ],
                )
              ],

            ),
          ),
        ),
      ),

    );
  }
}
