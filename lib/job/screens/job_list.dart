import 'package:alma_hub/screens/login_screen.dart';
import 'package:alma_hub/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:alma_hub/job/screens/add_job.dart';
import 'package:alma_hub/job/screens/login.dart';
import 'package:alma_hub/job/widgets/job_list_item.dart';

class JobList extends StatelessWidget {
  const JobList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mobileBackgroundColor,
        titleSpacing: 27,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Job Postings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchInput(),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: const [  
                  JobListItem(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const AddJobButton(),
    );
  }
}

class LogoutIcon extends StatelessWidget {
  const LogoutIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LoginScreen()));
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 27),
        child: Icon(Icons.logout_outlined),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 27, bottom: 15, left: 27),
    );
  }
}

class AddJobButton extends StatelessWidget {
  const AddJobButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      height: 74,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFE5E5E5),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AddJob()));
          },
          child: const Icon(
            Icons.add_outlined,
            color: Color(0xFF191720),
          ),
        ),
      ),
    );
  }
}
