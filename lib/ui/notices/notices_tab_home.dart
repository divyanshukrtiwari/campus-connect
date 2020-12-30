import 'package:flutter/material.dart';
import 'package:my_class/ui/notices/exams_notice_tab.dart';
import 'package:my_class/ui/notices/placement_notice_tab.dart';
import 'package:my_class/ui/notices/scholarship_notice_tab.dart';

class NoticesTabHome extends StatefulWidget {
  static const routeName = "/notices";
  @override
  _NoticesTabHomeState createState() => _NoticesTabHomeState();
}

class _NoticesTabHomeState extends State<NoticesTabHome> {
  List<Map<String, Object>> _pages = [
    {'page': ExamsNoticeTab()},
    {'page': PlacementNoticeTab()},
    {'page': ScholarshipNoticeTab()},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        //unselectedItemColor: Colors.indigo[100],
        onTap: _selectPage,
        //backgroundColor: Colors.pink[100],
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Exams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Scholarship',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Placements',
          ),
        ],
      ),
    );
  }
}
