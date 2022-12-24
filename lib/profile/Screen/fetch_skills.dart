import 'package:alma_hub/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class fetch_skills extends StatefulWidget {
  final String uid;
  const fetch_skills({Key? key, required this.uid}) : super(key: key);
  _FetchData createState() => _FetchData();
}

// String uid = FirebaseAuth.instance.currentUser!.uid;

class _FetchData extends State<fetch_skills> {
  // Query query =
  //     FirebaseDatabase.instance.ref().child('Students/' + uid + '/Skills');
  // DatabaseReference reference =
  //     FirebaseDatabase.instance.ref().child('Students/' + uid + '/Skills');

  Widget ListItem({required Map Students}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            spreadRadius: -4,
            blurRadius: 25,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(
        top: 11,
        bottom: 11,
        right: 27,
        left: 27,
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //"hgy",
                      Students['skill_name'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ]),
            ),
            GestureDetector(
              onTap: () {
                FirebaseDatabase.instance
                    .ref()
                    .child('Students/' + widget.uid + '/Skills')
                    .child(Students['key'])
                    .remove();
              },
              child: const Icon(
                Icons.delete_outline,
                size: 24,
                color: Color(0xFFFF5959),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Skills'),
          backgroundColor: mobileBackgroundColor,
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: FirebaseDatabase.instance
                .ref()
                .child('Students/' + widget.uid + '/Skills'),
            itemBuilder: (context, snapshot, animation, index) {
              Map Students = snapshot.value as Map;
              Students['key'] = snapshot.key;
              return ListItem(Students: Students);
            },
          ),
        ),
      ),
    );
  }
}
