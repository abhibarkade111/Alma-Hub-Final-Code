import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../widget/button.dart';

class EditCertificate extends StatefulWidget {
  const EditCertificate({Key? key, required this.studentKey}) : super(key: key);
  final String studentKey;
  _EditCertificate createState() => _EditCertificate();
}

class _EditCertificate extends State<EditCertificate> {
  final cer_name = TextEditingController();
  final cer_organization = TextEditingController();
  final cer_date = TextEditingController();

  late DatabaseReference dbref;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  void getStudentCertificateData() async {
    DataSnapshot snapshot = await dbref.child(widget.studentKey).get();
    Map student = snapshot.value as Map;
    cer_name.text = student['cer_name'];
    cer_organization.text = student['cer_organization'];
    cer_date.text = student['cer_issue_date'];
  }
  @override
  void initState() {
    super.initState();
    dbref = FirebaseDatabase.instance.ref().child('Students/'+uid+'/Certification');
    getStudentCertificateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        title: const Text("Edit Certificate",
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
                    text: "Update Certificate",
                    onPressed: () {
                      Map<String, String> students = {
                        'cer_name': cer_name.text,
                        'cer_organization': cer_organization.text,
                        'cer_issue_date': cer_date.text
                      };
                      dbref.child(widget.studentKey)
                          .update(students)
                          .then((value) => {
                            Navigator.pop(context)}
                          );
                    },
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
