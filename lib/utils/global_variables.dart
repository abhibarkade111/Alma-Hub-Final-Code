import 'package:alma_hub/job/screens/job_list.dart';
import 'package:alma_hub/profile/Screen/Home.dart';
import 'package:alma_hub/screens/add_post_screen.dart';
import 'package:alma_hub/screens/feed_screen.dart';
import 'package:alma_hub/screens/profile_screen.dart';
import 'package:alma_hub/screens/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const webScreenSize = 600;

 List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const JobList(),
  //const HomePage(title: "Profile",)
   ProfileScreen(
     uid: FirebaseAuth.instance.currentUser!.uid,
   ),
];
