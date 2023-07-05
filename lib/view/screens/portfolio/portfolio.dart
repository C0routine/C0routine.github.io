import 'package:flutter/material.dart';

import 'package:blog/view/widgets/portfolio/portfolio_intro.dart';
import 'package:blog/view/widgets/portfolio/portfolio_aboutMe.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PortfolioIntro(),
            PortfolioAboutMe(),
          ],
        ),
      ),
    );
  }
}
