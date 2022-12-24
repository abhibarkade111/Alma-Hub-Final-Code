import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widget/button.dart';

class AddCertificate extends StatefulWidget {
  const AddCertificate({Key? key}) : super(key: key);
  _AddCertificate createState() => _AddCertificate();
}

class _AddCertificate extends State<AddCertificate> {
  final cer_name = TextEditingController();
  final cer_organization = TextEditingController();
  final cer_date = TextEditingController();

  late DatabaseReference dbRef;
  //CollectionReference db;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance
        .ref()
        .child('Students/' + uid + '/Certification');
    //db = FirebaseFirestore.instance.collection('Students');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        title: const Text("Add New Certificate",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(right: 27, bottom: 59, left: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: cer_name,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Certificate Name",
                      hintText: 'Enter Certificate Name',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: cer_organization,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Organization Name",
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: cer_date,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: "Certificate Date",
                      hintText: 'Date',
                    ),
                  ),
                  const SizedBox(height: 15),
                  Button(
                    text: "Add Certificate",
                    onPressed: () {
                      /*return db
                          .add({
                            'cer_name': cer_name.text,
                            'cer_organization': cer_organization.text,
                            'cer_issue_date': cer_date.text
                          })
                          .then((value) => print("User Added"))
                          .catchError((error) => print(
                              "Failed to add user: $error")); */

                      Map<String, String> education = {
                        'cer_name': cer_name.text,
                        'cer_organization': cer_organization.text,
                        'cer_issue_date': cer_date.text
                      };

                      dbRef.push().set(education);
                      Navigator.pop(context);
                    },
                    key: null,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
