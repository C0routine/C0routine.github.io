import 'package:flutter/material.dart';
import 'package:blog/view/widgets/portfolio/portfolio_intro.dart';
import 'package:blog/view/widgets/portfolio/portfolio_aboutMe.dart';
import 'package:blog/view/widgets/portfolio/portfolio_project.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
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
                print('scroll event listen');
                if ((scroll.metrics.pixels / scroll.metrics.maxScrollExtent) > 0.15 && aboutMeImageOpacity == 0.0) {
                  print('Animation Start');
                  setState(() => aboutMeImageOpacity = 1.0);
                  return false;
                }
                return true;
              },
        child: SingleChildScrollView(
          child: Column(
            children: [
              PortfolioIntro(),
              PortfolioAboutMe(aboutMeImageOpacity: aboutMeImageOpacity),
              PortfolioProject(),
            ],
          ),
        ),
      ),
    );
  }
}
