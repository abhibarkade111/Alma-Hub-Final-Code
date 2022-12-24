import 'package:alma_hub/job/widgets/button.dart';
import 'package:alma_hub/profile/Screen/fetch_certificate.dart';
import 'package:alma_hub/profile/Screen/fetch_education.dart';
import 'package:alma_hub/profile/Screen/fetch_experience.dart';
import 'package:alma_hub/profile/Screen/fetch_skills.dart';
import 'package:alma_hub/profile/add_widget/add_certificate.dart';
import 'package:alma_hub/profile/add_widget/add_education.dart';
import 'package:alma_hub/profile/add_widget/add_experience.dart';
import 'package:alma_hub/profile/add_widget/add_skill.dart';
import 'package:alma_hub/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';

import '../Edit_widgets/edit_certificate.dart';
import '../Edit_widgets/edit_education.dart';
import '../Edit_widgets/edit_experience.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({
    Key? key,
    required this.title,
    required this.uid,
  }) : super(key: key);
  final String title;
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: mobileBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30, bottom: 10),
                            child: Text(
                              'Experiences',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.uid == FirebaseAuth.instance.currentUser!.uid
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const AddExperience()));
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.add,
                                  color: mobileBackgroundColor,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: secondaryColor, width: 1)),
                              ))
                          : Text(""),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                    fetch_experience(uid: widget.uid)));
                          },
                          child: Container(
                            height: 60,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "View",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.skip_next,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
              // Container(
              //   alignment: Alignment.center,
              //   margin: const EdgeInsets.fromLTRB(100, 10, 100, 10),
              //   padding: const EdgeInsets.all(5.0),
              //   decoration: BoxDecoration(
              //     color: secondaryColor,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Button(
              //     text: "View",
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => HomePage(
              //                 title: "Profile",
              //               )));
              //     },
              //   ),
              // ),
              Row(
                children: [
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30, bottom: 10),
                            child: Text(
                              'Education',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.uid == FirebaseAuth.instance.currentUser!.uid
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const AddEducation()));
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.add,
                                  color: mobileBackgroundColor,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: secondaryColor, width: 1)),
                              ))
                          : Text(""),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>  fetch_education(uid : widget.uid)));
                          },
                          child: Container(
                            height: 60,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "View",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.skip_next,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
              Row(
                children: [
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30, bottom: 10),
                            child: Text(
                              'Certificate',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.uid == FirebaseAuth.instance.currentUser!.uid
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const AddCertificate()));
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.add,
                                  color: mobileBackgroundColor,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: secondaryColor, width: 1)),
                              ))
                          : Text(""),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>  fetch_certificate(uid : widget.uid)));
                          },
                          child: Container(
                            height: 60,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "View",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.skip_next,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
              Row(
                children: [
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30, bottom: 10),
                            child: Text(
                              'Skills',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.uid == FirebaseAuth.instance.currentUser!.uid
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const AddSkill()));
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.add,
                                  color: mobileBackgroundColor,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: secondaryColor, width: 1)),
                              ))
                          : Text(""),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>  fetch_skills(uid : widget.uid)));
                          },
                          child: Container(
                            height: 60,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "View",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.skip_next,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
