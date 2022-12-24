import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../widget/button.dart';

class AddEducation extends StatefulWidget {
  const AddEducation({Key? key}) : super(key: key);
  _AddEducation createState() => _AddEducation();
}

class _AddEducation extends State<AddEducation> {
  final clg_name = TextEditingController();
  final clg_branch = TextEditingController();
  final clg_start_date = TextEditingController();
  final clg_end_date = TextEditingController();

  late DatabaseReference dbRef;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    dbRef =
        FirebaseDatabase.instance.ref().child('Students/' + uid + '/Education');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        title: const Text("Add New Education",
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
                      hintText: 'Name',
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
                      labelText: "Start Date",
                      hintText: 'mm/yyyy',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: clg_end_date,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: "End Date",
                      hintText: 'mm/yyyy',
                    ),
                  ),
                  const SizedBox(height: 15),
                  Button(
                    text: "Add Education",
                    onPressed: () {
                      Map<String, String> education = {
                        'clg_name': clg_name.text,
                        'branch_name': clg_branch.text,
                        'clg_start_date': clg_start_date.text,
                        'clg_end_date': clg_end_date.text
                      };

                      dbRef.push().set(education);
                      Navigator.pop(context);
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
