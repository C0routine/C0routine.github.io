import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PortfolioScreen();
}

class _PortfolioScreen extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return ListView(

      );
    }

    Widget mobileUI() {
      return ListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Test App Bar'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return desktopUI();
          } else {
            return mobileUI();
          }
        },
      ),
    );
  }
}
