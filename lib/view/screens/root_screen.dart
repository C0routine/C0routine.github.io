import 'package:blog/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> screenList = [
      Container(color: Colors.red),
      const ProfileScreen(),
      Container(color: Colors.blue),
    ];

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            // rail 확장
            extended: false,
            // icons 위치
            groupAlignment: 0.0,
            // select 한 label text 만 show
            labelType: NavigationRailLabelType.selected,
            // rail icon setting
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.maps_home_work_outlined),
                selectedIcon: Icon(Icons.maps_home_work_rounded),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_search_outlined),
                selectedIcon: Icon(Icons.person_search_rounded),
                label: Text('Profile'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.code_rounded),
                selectedIcon: Icon(Icons.code_rounded),
                label: Text('Tech'),
              ),
            ],
            // rail selected change
            onDestinationSelected: (int select) {
              if (_selectIndex != select) {
                setState(() {
                  _selectIndex = select;
                });
              }
            },
            // rail select value
            selectedIndex: _selectIndex,
          ),
          const VerticalDivider(thickness: 0.16, width: 0),
          Expanded(child: screenList[_selectIndex]),
        ],
      ),
    );
  }
}
