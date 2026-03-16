import 'package:flutter/material.dart';
import 'SousPages/appbar11.dart';
import 'SousPages/business.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{

  int selectedIndex = 0;

  late TabController tabController;
  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }

  late List<Widget> appbar1 = [
    Appbar11(tabController: tabController),
    Business(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: appbar1[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.yellow,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, size: 35),
            label: 'Business',
          ),
        ],
      ),
    );
  }
}
