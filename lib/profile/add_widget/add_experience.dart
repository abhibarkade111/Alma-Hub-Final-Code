import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../widget/button.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({Key? key}) : super(key: key);
  _AddExperience createState() => _AddExperience();
}

class _AddExperience extends State<AddExperience> {
  final cmp_name = TextEditingController();
  final cmp_position = TextEditingController();
  final cmp_description = TextEditingController();
  final cmp_start_date = TextEditingController();
  final cmp_end_date = TextEditingController();

  late DatabaseReference dbRef;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students/'+uid+'/Experiences');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        title: const Text("Add New Experience",
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
                    text: "Add Experience",
                     onPressed: () {
                      Map<String, String> education = {
                        'cmp_name': cmp_name.text,
                        'cmp_position':cmp_position.text,
                        'cmp_description': cmp_description.text,
                        'cmp_start_date': cmp_start_date.text,
                        'cmp_end_date': cmp_end_date.text
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
