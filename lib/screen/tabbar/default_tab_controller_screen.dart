import 'package:flutter/material.dart';

class DefaultTabControllerScreen extends StatefulWidget {
  const DefaultTabControllerScreen({super.key});

  @override
  State<DefaultTabControllerScreen> createState() => _DefaultTabControllerScreenState();
}

class _DefaultTabControllerScreenState extends State<DefaultTabControllerScreen> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 8, vsync: this);

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DefaultTabControllerScreen'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            _tabBar(),
            SizedBox(
              height: 400,
              child: _tabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      controller: tabController,
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(text: '탭 A'),
        Tab(text: '탭 B'),
        Tab(text: '탭 C'),
      ],
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      viewportFraction: 0.9,
      controller: tabController,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset("assets/lecture_flutter_image.png"),
        ),
        Container(margin: const EdgeInsets.symmetric(horizontal: 20), color: Colors.red),
        Container(margin: const EdgeInsets.symmetric(horizontal: 20), color: Colors.blue),
      ],
    );
  }
}