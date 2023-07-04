import 'package:flutter/material.dart';
import 'package:blog/view/widgets/global/header_drawer.dart';
import 'package:blog/view/widgets/global/navigation_header.dart';

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
      endDrawer: HeaderDrawer(scaffoldKey: _scaffoldKey),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavigationHeaders(scaffoldKey: _scaffoldKey),
            ],
          ),
        ),
      ),
    );
  }
}
