import 'package:alma_hub/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../chat/pages/home_page.dart';
import '../utils/colors.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          centerTitle: false,
          title: SvgPicture.asset(
            'assets/logo_2.svg',
            color: primaryColor,
            height: 32,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: _page == 0 ? primaryColor : secondaryColor,
              ),
              onPressed: () => navigationTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: _page == 1 ? primaryColor : secondaryColor,
              ),
              onPressed: () => navigationTapped(1),
            ),
            IconButton(
              icon: Icon(
                Icons.add_a_photo,
                color: _page == 2 ? primaryColor : secondaryColor,
              ),
              onPressed: () => navigationTapped(2),
            ),
            IconButton(
              icon: Icon(
                Icons.work_outline,
                color: _page == 3 ? primaryColor : secondaryColor,
              ),
              onPressed: () => navigationTapped(3),
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: _page == 4 ? primaryColor : secondaryColor,
              ),
              onPressed: () => navigationTapped(4),
            ),
            IconButton(
              icon: Icon(
                Icons.messenger_outline,
                color: _page == 5 ? primaryColor : secondaryColor,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: homeScreenItems,
          controller: pageController,
          onPageChanged: onPageChanged,
        ));
  }
}
