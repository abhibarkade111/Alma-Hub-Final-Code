import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:alma_hub/job/widgets/button.dart';
import 'package:alma_hub/job/widgets/input_field.dart';

class AddJob extends StatefulWidget {
  const AddJob({Key? key}) : super(key: key);
  _AddJob createState() => _AddJob();
}

class _AddJob extends State<AddJob> {
  final role_name=TextEditingController();
  final cmp_name = TextEditingController();
  final role_desc = TextEditingController();
  final cmp_location = TextEditingController();
  final apply_link = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Jobs');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        title: const Text("Add New Job",
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
                      labelText: "Name of Company",
                      hintText: 'Company Name',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: role_name,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Name of Position",
                      hintText: 'Position Name',
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: role_desc,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Description",
                      hintText: 'Description about Role',
                    ),
                    maxLines: 13,
                    
                  ),

                  const SizedBox(height: 15),
                  TextField(
                    controller: cmp_location,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Location of Company",
                      hintText: 'Location',
                    ),
                  ),
                   const SizedBox(height: 15),
                    TextField(
                    controller: apply_link,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Link for Apply",
                      hintText: 'Link Here',
                    ),                    
                  ),
                  const SizedBox(height: 15),
                  Button(
                    text: "Add Job",
                    onPressed: () {
                      Map<String, String> job_details= {
                        'cmp_name': cmp_name.text,
                        'role_name': role_name.text,
                        'role_desc':role_desc.text,
                        'cmp_location':cmp_location.text,
                        'apply_link':apply_link.text
                      };
                      dbRef.push().set(job_details);
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
