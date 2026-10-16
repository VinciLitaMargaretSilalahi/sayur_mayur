import 'package:flutter/material.dart';
import 'package:sayur_mayur/screen/sayur_page.dart';
import 'package:sayur_mayur/widget/navbar_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFF545D68),
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Pembelian Sayur',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFF545D68),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFFF545D68),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          const SizedBox(height: 8),

          const Text(
            'List Sayur Tegar',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF545D68),
            ),
          ),

          const SizedBox(height: 8),

          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: const Color(0xFFFCC88D67),
            isScrollable: true,
            labelPadding:
                const EdgeInsets.only(right: 24),
            unselectedLabelColor:
                const Color(0xFFCDCDCD),
            tabs: const [
              Tab(
                child: Text(
                  'Sayur Box',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Sayur Slice',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Sayur Mayur',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height - 160,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: const [
                SayurPage(),
                SayurPage(),
                SayurPage(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF177532),
        child: const Icon(Icons.fastfood),
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}