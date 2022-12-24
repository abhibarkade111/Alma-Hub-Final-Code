import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobListItem extends StatefulWidget {
  const JobListItem({
    Key? key,
  }) : super(key: key);
  _JobList createState() => _JobList();
}

class _JobList extends State<JobListItem> {
  Query query = FirebaseDatabase.instance.ref().child('Jobs');

  get reference => query;

  Widget ListItem({required Map job}) {
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
        right: 10,
        left: 10,
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
                    Text(job['cmp_name'],
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 41, 41, 49))),
                    Text(job['role_name'],
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 41, 41, 49))),
                    Text(job['role_desc'],
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF8F8F9E))),
                    Text(job['cmp_location'],
                        style: TextStyle(
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0))),
                    TextButton(
                      onPressed: () => launchUrl(Uri.parse(job['apply_link'])),
                      child: Text(
                        'Apply',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ]),
            ),
            const SizedBox(width: 25),
            GestureDetector(
              onTap: () {
                reference.child(job['key']).remove();
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF201E27),
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
        top: 1,
        bottom: 11,
        right: 10,
        left: 10,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Expanded(
            child: FirebaseAnimatedList(
              query: query,
              shrinkWrap: true,
              itemBuilder: (context, snapshot, animation, index) {
                Map Job = snapshot.value as Map;
                Job['key'] = snapshot.key;
                return ListItem(job: Job);
              },
            ),
          ),
        ),
      ),
    );
  }
}
