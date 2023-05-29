import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            // rail 확장
            extended: false,
            useIndicator: true,
            indicatorColor: Colors.transparent,
            // icons 위치
            groupAlignment: 0.0,
            // select 한 label text 만 show
            labelType: NavigationRailLabelType.selected,
            // rail icon setting
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.maps_home_work_outlined, color: AppColor.disable),
                selectedIcon: Icon(Icons.maps_home_work_rounded, color: AppColor.accent),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_search_outlined, color: AppColor.disable),
                selectedIcon: Icon(Icons.person_search_rounded, color: AppColor.accent),
                label: Text('Portfolio'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.code_rounded, color: AppColor.disable),
                selectedIcon: Icon(Icons.code_rounded, color: AppColor.accent),
                label: Text(
                  'Tech',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
          const VerticalDivider(thickness: 2, width: 0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
