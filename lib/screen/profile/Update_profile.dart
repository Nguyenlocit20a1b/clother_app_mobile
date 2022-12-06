
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../config/text_string.dart';
import 'Profile.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 130,
                    height: 130,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                        const Image(image: AssetImage("assets/images/avata.jpg"))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromARGB(255, 255, 191, 0)),
                        child: const Icon(

                          LineAwesomeIcons.camera,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Enter FullName"),
                            prefixIcon: Icon(LineAwesomeIcons.user)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Enter Email"),
                            prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Enter Password"),
                            prefixIcon: Icon(LineAwesomeIcons.lock)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.amber,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(
                              tEditProfile,
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "       Joined ",
                              style: TextStyle(fontSize: 12),
                              children: [
                                TextSpan(
                                    text: " 20 November 2022  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 12))
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: const StadiumBorder(),
                                side: BorderSide.none),
                            child: const Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
