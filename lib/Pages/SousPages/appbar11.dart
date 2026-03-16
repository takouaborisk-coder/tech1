import 'package:flutter/material.dart';
import 'package:tech1/Pages/SousPages/sams.dart';
import 'package:tech1/Pages/SousPages/xiaomi.dart';

import 'apple.dart';
import 'huaiwe.dart';
import 'micro.dart';



class Appbar11 extends StatefulWidget {
  final TabController tabController;
  const Appbar11({super.key, required this.tabController});

  @override
  State<Appbar11> createState() => _Appbar11State();
}

class _Appbar11State extends State<Appbar11> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled){
        return [
          SliverAppBar(
          backgroundColor: const Color(0xff222f42),
          pinned: true,
          expandedHeight: 100,
          flexibleSpace: const FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            titlePadding: EdgeInsets.only(bottom: 60, left: 12),
            title: Text('Actualité Tech', style: TextStyle(color: Colors.white)),
          ),

          bottom: TabBar(
            controller: widget.tabController,
            indicatorColor: Colors.white,
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            tabAlignment: TabAlignment.start,
            // indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(text: 'SAMSUNG'),
              Tab(text: 'XIAOMI'),
              Tab(text: 'APPLE'),
              Tab(text: 'MICROSOFT'),
              Tab(text: 'HUAWEI'),
            ],
          ),
        ),];
      },
      body: TabBarView(
        controller: widget.tabController,
        children: [
          Sams(),
          Xiaomi(),
          Apple(),
          Micros(),
          Huaiwe(),
        ],
      ),
    );
  }
}
