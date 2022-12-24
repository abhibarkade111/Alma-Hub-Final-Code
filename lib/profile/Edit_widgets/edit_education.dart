import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../widget/button.dart';

class EditEducation extends StatefulWidget {
  const EditEducation({Key? key, required this.studentKey}) : super(key: key);
  final String studentKey;
  _EditEducation createState() => _EditEducation();
}

class _EditEducation extends State<EditEducation> {
  final clg_name = TextEditingController();
  final clg_branch = TextEditingController();
  final clg_start_date = TextEditingController();
  final clg_end_date = TextEditingController();

  late DatabaseReference dbref;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  void getStudentCertificateData() async {
    DataSnapshot snapshot = await dbref.child(widget.studentKey).get();
    Map student = snapshot.value as Map;
    clg_name.text = student['clg_name'];
    clg_branch.text = student['branch_name'];
    clg_start_date.text = student['clg_start_date'];
    clg_end_date.text = student['clg_end_date'];
  }
  @override
  void initState() {
    super.initState();
    dbref = FirebaseDatabase.instance.ref().child('Students/'+uid+'/Education');
    getStudentCertificateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        title: const Text("Edit Education",
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
                    controller: clg_name,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "College Name",
                      hintText: 'Enter College Name',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: clg_branch,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Branch Name",
                      hintText: 'Enter Branch Name',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: clg_start_date,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: "College Start Date",
                      hintText: 'Enter College Start Date',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: clg_end_date,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: "College End Date",
                      hintText: 'Enter College End Date',
                    ),
                  ),
                  const SizedBox(height: 15),
                  Button(
                    text: "Update Education",
                    onPressed: () {
                      Map<String, String> students = {
                        'clg_name': clg_name.text,
                        'branch_name': clg_branch.text,
                        'clg_start_date': clg_start_date.text,
                        'clg_end_date': clg_end_date.text
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
