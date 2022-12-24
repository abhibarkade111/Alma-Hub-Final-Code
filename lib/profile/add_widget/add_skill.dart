import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../widget/button.dart';

class AddSkill extends StatefulWidget {
  const AddSkill({Key? key}) : super(key: key);
  _AddSkill createState() => _AddSkill();
}

class _AddSkill extends State<AddSkill> {
  final skill_name = TextEditingController();

  late DatabaseReference dbRef;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students/'+uid+'/Skills');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        title: const Text("Add New Skill",
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
                    controller: skill_name,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Skill",
                      hintText: 'Skill Name',
                    ),
                  ),
                  const SizedBox(height: 15),
                  Button(
                    text: "Add Skill",
                    onPressed: () {
                      Map<String, String> skill= {
                        'skill_name': skill_name.text,
                      };

                      dbRef.push().set(skill);
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
