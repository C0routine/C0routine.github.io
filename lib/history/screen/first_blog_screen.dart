import 'package:flutter/material.dart';
import 'package:blog/history/components/first/first_blog_intro.dart';
import 'package:blog/history/components/first/first_blog_project.dart';
import 'package:blog/history/components/first/first_blog_about_me.dart';
import 'package:blog/history/components/first/first_blog_navigation_header.dart';

class FirstBlogScreen extends StatefulWidget {
  const FirstBlogScreen({super.key});

  @override
  State<FirstBlogScreen> createState() => _FirstBlogScreenState();
}

class _FirstBlogScreenState extends State<FirstBlogScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double aboutMeImageOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<ScrollNotification>(
        onNotification: aboutMeImageOpacity != 0.0
            ? null
            : (ScrollNotification scroll) {
                // print('scroll event listen');
                if ((scroll.metrics.pixels / scroll.metrics.maxScrollExtent) > 0.15 && aboutMeImageOpacity == 0.0) {
                  // print('Animation Start');
                  setState(() => aboutMeImageOpacity = 1.0);
                  return false;
                }
                return true;
              },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const FirstBlogIntro(),
                  FirstBlogNavigationHeaders(scaffoldKey: _scaffoldKey),
                ],
              ),
              FirstBlogAboutMe(aboutMeImageOpacity: aboutMeImageOpacity),
              const FirstBlogProject(),
            ],
          ),
        ),
      ),
    );
  }
}
