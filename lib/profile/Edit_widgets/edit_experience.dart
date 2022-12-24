import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../widget/button.dart';

class EditExperience extends StatefulWidget {
  const EditExperience({Key? key, required this.studentKey}) : super(key: key);
  final String studentKey;
  _EditExperience createState() => _EditExperience();
}

class _EditExperience extends State<EditExperience> {
  final cmp_name = TextEditingController();
  final cmp_position = TextEditingController();
  final cmp_description = TextEditingController();
  final cmp_start_date = TextEditingController();
  final cmp_end_date = TextEditingController();

  late DatabaseReference dbref;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  void getStudentExperiencesData() async {
    DataSnapshot snapshot = await dbref.child(widget.studentKey).get();
    Map student = snapshot.value as Map;
    cmp_name.text = student['cmp_name'];
    cmp_position.text = student['cmp_position'];
    cmp_description.text = student['cmp_description'];
    cmp_start_date.text = student['cmp_start_date'];
    cmp_end_date.text = student['cmp_end_date'];
  }

  @override
  void initState() {
    super.initState();
    dbref = FirebaseDatabase.instance
        .ref()
        .child('Students/' + uid + '/Experiences');
    getStudentExperiencesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        title: const Text("Edit Experiences",
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
                    controller: cmp_name,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Company Name",
                      hintText: 'Enter Company Name',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: cmp_position,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Position/Role",
                      hintText: 'Enter Your Role',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: cmp_description,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Company Description",
                      hintText: 'Enter Description',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: cmp_start_date,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: "Start Date",
                      hintText: 'Start Date',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: cmp_end_date,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: "End Date",
                      hintText: 'End Date',
                    ),
                  ),
                  const SizedBox(height: 15),
                  Button(
                    text: "Edit Experience",
                    onPressed: () {
                      Map<String, String> students = {
                        'cmp_name': cmp_name.text,
                        'cmp_position': cmp_position.text,
                        'cmp_description': cmp_description.text,
                        'cmp_start_date': cmp_start_date.text,
                        'cmp_end_date': cmp_end_date.text
                      };
                      dbref
                          .child(widget.studentKey)
                          .update(students)
                          .then((value) => {Navigator.pop(context)});
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
